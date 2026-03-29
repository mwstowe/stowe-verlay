# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
PYPI_PN="calibreweb"

inherit distutils-r1 pypi systemd

DESCRIPTION="Web app for browsing, reading and downloading eBooks stored in a Calibre database"
HOMEPAGE="https://github.com/janeczku/calibre-web"
SRC_URI="$(pypi_sdist_url "${PYPI_PN}" "${PV}")"
S="${WORKDIR}/${PYPI_PN}-${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="calibre comics gdrive kepubify kobo ldap metadata oauth unrar"
RESTRICT="test"

PATCHES=(
	"${FILESDIR}"/fix-flask-limiter-3.x.patch
)

RDEPEND="
	acct-user/calibre
	acct-group/calibre
	>=dev-python/apscheduler-3.6.3[${PYTHON_USEDEP}]
	>=dev-python/babel-1.3[${PYTHON_USEDEP}]
	>=dev-python/bleach-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/certifi-2024.7.4[${PYTHON_USEDEP}]
	>=dev-python/chardet-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-39.0.0[${PYTHON_USEDEP}]
	>=dev-python/flask-1.0.2[${PYTHON_USEDEP}]
	>=dev-python/flask-babel-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/flask-httpauth-4.4.0[${PYTHON_USEDEP}]
	>=dev-python/flask-limiter-2.3.0[${PYTHON_USEDEP}] <dev-python/flask-limiter-4[${PYTHON_USEDEP}]
	>=dev-python/flask-principal-0.3.2[${PYTHON_USEDEP}]
	>=dev-python/flask-wtf-0.14.2[${PYTHON_USEDEP}]
	>=dev-python/lxml-4.9.1[${PYTHON_USEDEP}]
	>=dev-python/netifaces-plus-0.12.0[${PYTHON_USEDEP}]
	>=dev-python/pycountry-20.0.0[${PYTHON_USEDEP}]
	>=dev-python/pypdf-6.1.3[${PYTHON_USEDEP}]
	>=dev-python/python-magic-0.4.27[${PYTHON_USEDEP}]
	>=dev-python/pytz-2016.10[${PYTHON_USEDEP}]
	>=dev-python/regex-2022.3.2[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.0[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/tornado-6.4.2[${PYTHON_USEDEP}]
	>=dev-python/unidecode-0.04.19[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.22[${PYTHON_USEDEP}]
	>=dev-python/wand-0.4.4[${PYTHON_USEDEP}]
	calibre? ( app-text/calibre )
	comics? ( >=dev-python/natsort-2.2.0[${PYTHON_USEDEP}] )
	gdrive? (
		dev-python/gevent[${PYTHON_USEDEP}]
		dev-python/google-api-python-client[${PYTHON_USEDEP}]
		dev-python/oauth2client[${PYTHON_USEDEP}]
		dev-python/pydrive2[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
	)
	kobo? ( >=dev-python/jsonschema-3.2.0[${PYTHON_USEDEP}] )
	ldap? (
		dev-python/python-ldap[${PYTHON_USEDEP}]
		dev-python/flask-simpleldap[${PYTHON_USEDEP}]
	)
	metadata? (
		>=dev-python/beautifulsoup4-4.0.1[${PYTHON_USEDEP}]
		>=dev-python/markdown2-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/python-dateutil-2.1[${PYTHON_USEDEP}]
	)
	oauth? (
		>=dev-python/flask-dance-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/sqlalchemy-utils-0.33.5[${PYTHON_USEDEP}]
	)
	unrar? ( app-arch/unrar )
	kepubify? ( app-text/kepubify-bin )
"

src_install() {
	distutils-r1_src_install

	newinitd "${FILESDIR}"/calibre-web.initd calibre-web
	newconfd "${FILESDIR}"/calibre-web.confd calibre-web
	systemd_dounit "${FILESDIR}"/calibre-web.service

	keepdir /var/lib/calibre-web
	fowners calibre:calibre /var/lib/calibre-web

	keepdir /var/log/calibre-web
	fowners calibre:calibre /var/log/calibre-web
}

pkg_postinst() {
	elog "Calibre-Web is now installed."
	elog ""
	elog "To start calibre-web:"
	elog "  rc-service calibre-web start"
	elog ""
	elog "Then access the web interface at http://localhost:8083"
	elog "Default login: admin / admin123"
	elog ""
	elog "You will need to point it at an existing Calibre database"
	elog "(metadata.db) on first setup via the web interface."
	elog ""
	elog "Data is stored in /var/lib/calibre-web"
	elog "Override with CALIBRE_WEB_DATADIR in /etc/conf.d/calibre-web"
	if use calibre; then
		elog ""
		elog "Calibre tools (ebook-convert, calibredb) are available for"
		elog "format conversion and metadata embedding. Configure paths"
		elog "in the Calibre-Web admin interface under Basic Configuration."
	fi
	if use unrar; then
		elog ""
		elog "unrar is available for CBR comic book extraction."
		elog "Configure the path in the admin interface."
	fi
	if use kepubify; then
		elog ""
		elog "kepubify is available for EPUB to Kobo KEPUB conversion."
		elog "Set the path to /usr/bin/kepubify in the admin interface."
	fi
}
