# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 systemd

DESCRIPTION="Automated media lifecycle management for Plex (Sonarr/Radarr/Medusa/Ombi)"
HOMEPAGE="https://github.com/mwstowe/mediadecay"
SRC_URI="https://github.com/mwstowe/mediadecay/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
# MediaDecay must run as the account that owns the media it deletes/moves. That
# account differs per deployment. The 'sabnzbd' USE flag wires up the common
# case (media owned by the sabnzbd download client): it pulls the sabnzbd
# account and makes the service default to it. With the flag disabled, the
# package makes no assumption — data dirs are owned by root and the admin picks
# the runtime user (see pkg_postinst).
IUSE="+sabnzbd"
RESTRICT="mirror test"

RDEPEND="
	>=dev-python/flask-3.1.1[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-2.0.50[${PYTHON_USEDEP}]
	>=dev-python/PlexAPI-4.15.16[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.3[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0.2[${PYTHON_USEDEP}]
	>=dev-python/ruamel-yaml-0.18[${PYTHON_USEDEP}]
	>=dev-python/bcrypt-4.2.1[${PYTHON_USEDEP}]
	>=dev-python/cheroot-11.1.2[${PYTHON_USEDEP}]
	sabnzbd? (
		acct-user/sabnzbd
		acct-group/sabnzbd
	)
"

# Ownership for the managed data/log dirs. With USE=sabnzbd the service runs as
# sabnzbd and these are owned by it; otherwise they are root-owned and the admin
# chowns them to their chosen runtime user.
_md_owner() { use sabnzbd && echo "sabnzbd:sabnzbd" || echo "root:root"; }
_md_cfg_owner() { use sabnzbd && echo "root:sabnzbd" || echo "root:root"; }

src_install() {
	distutils-r1_src_install

	newinitd "${FILESDIR}"/mediadecay.initd mediadecay
	newconfd "${FILESDIR}"/mediadecay.confd mediadecay
	systemd_dounit "${FILESDIR}"/mediadecay.service

	# With USE=sabnzbd, drop in a systemd override so the unit runs as sabnzbd
	# without the admin needing `systemctl edit`. Without the flag, the shipped
	# unit's commented defaults apply and the admin sets User=/Group= themselves.
	if use sabnzbd; then
		systemd_install_dropin mediadecay.service "${FILESDIR}"/mediadecay-sabnzbd.conf
	fi

	# Config lives under /etc; install the example as a reference.
	insinto /etc/mediadecay
	newins config.yaml.example config.yaml.example

	keepdir /var/lib/mediadecay
	fowners "$(_md_owner)" /var/lib/mediadecay
	fperms 0750 /var/lib/mediadecay

	keepdir /var/log/mediadecay
	fowners "$(_md_owner)" /var/log/mediadecay
	fperms 0750 /var/log/mediadecay

	keepdir /etc/mediadecay
	fowners "$(_md_cfg_owner)" /etc/mediadecay
	fperms 0750 /etc/mediadecay
}

pkg_postinst() {
	elog "MediaDecay is now installed."
	elog ""
	elog "1. Create your configuration:"
	elog "     cp /etc/mediadecay/config.yaml.example /etc/mediadecay/config.yaml"
	elog "     \${EDITOR} /etc/mediadecay/config.yaml"
	elog ""
	elog "2. Set the database path in config.yaml to the managed data dir:"
	elog "     database:"
	elog "       path: /var/lib/mediadecay/mediadecay.db"
	elog ""
	elog "3. Generate the web admin password hash:"
	elog "     python3 -c \"import bcrypt; print(bcrypt.hashpw(b'yourpass', bcrypt.gensalt()).decode())\""
	elog ""
	if use sabnzbd; then
		elog "The service is configured to run as the sabnzbd user, which owns the"
		elog "managed media on this system. Secure the config (it holds secrets):"
		elog "     chown root:sabnzbd /etc/mediadecay/config.yaml && chmod 0640 /etc/mediadecay/config.yaml"
	else
		elog "IMPORTANT: MediaDecay deletes and moves your media files, so it must run"
		elog "as the user/group that OWNS those files (e.g. plex, media, sabnzbd)."
		elog "Choose that user, then:"
		elog ""
		elog "  a) Give it the data/log/config dirs:"
		elog "       chown -R USER:GROUP /var/lib/mediadecay /var/log/mediadecay"
		elog "       chown root:GROUP /etc/mediadecay /etc/mediadecay/config.yaml"
		elog "       chmod 0750 /etc/mediadecay && chmod 0640 /etc/mediadecay/config.yaml"
		elog ""
		elog "  b) Point the service at that user:"
		elog "       systemd:  systemctl edit mediadecay   (set [Service] User=/Group=)"
		elog "       OpenRC:   set MEDIADECAY_USER/GROUP in /etc/conf.d/mediadecay"
	fi
	elog ""
	elog "4. Start the service (systemd):"
	elog "     systemctl enable --now mediadecay"
	elog "   or (OpenRC):"
	elog "     rc-update add mediadecay default && rc-service mediadecay start"
	elog ""
	elog "Config:  /etc/mediadecay/config.yaml"
	elog "Data/DB: /var/lib/mediadecay/"
	elog "Logs:    /var/log/mediadecay/"
	elog ""
	elog "dev-python/PlexAPI is provided by this overlay. TLS is terminated"
	elog "in-process by cheroot when web.ssl_cert/web.ssl_key are set."
}
