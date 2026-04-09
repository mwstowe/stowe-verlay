# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit webapp

DESCRIPTION="Web-based administration for VirtualBox in PHP"
HOMEPAGE="https://github.com/phpvirtualbox/phpvirtualbox/"
SRC_URI="https://github.com/phpvirtualbox/phpvirtualbox/archive/refs/tags/7.2-3.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"
LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-lang/php[session,unicode,soap,gd]
	virtual/httpd-php:*
"

S="${WORKDIR}/phpvirtualbox-7.2-3"

src_install() {
	local DISABLE_AUTOFORMATTING="true"

	webapp_src_preinst

	dodoc CHANGELOG.txt LICENSE.txt README.md
	rm -f CHANGELOG.txt LICENSE.txt README.md

	insinto "${MY_HTDOCSDIR}"
	doins -r .

	webapp_configfile "${MY_HTDOCSDIR}"/config.php-example
	webapp_serverowned "${MY_HTDOCSDIR}"/config.php-example

	webapp_src_install
	if has_version app-emulation/virtualbox[vboxwebsrv] || \
		has_version app-emulation/virtualbox-bin[vboxwebsrv]
	then
		newinitd "${FILESDIR}"/vboxinit-initd vboxinit
	fi

	dodir "${MY_HTDOCSDIR}/endpoints/lib"
		dosym vboxweb-7.2.wsdl "${MY_HTDOCSDIR}/endpoints/lib/vboxweb.wsdl"
		dosym vboxwebService-7.2.wsdl "${MY_HTDOCSDIR}/endpoints/lib/vboxwebService.wsdl"
}

pkg_postinst() {
	webapp_pkg_postinst
}
