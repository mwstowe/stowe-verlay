# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit webapp

DESCRIPTION="Web picture gallery written in PHP with a MySQL backend"
HOMEPAGE="http://coppermine.sourceforge.net/"
SRC_URI="https://github.com/coppermine-gallery/cpg1.6.x/archive/v${PV}.zip"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~sparc ~x86"
IUSE=""

BDEPEND="app-arch/unzip"
RDEPEND="virtual/httpd-php
	dev-lang/php[gd,mysql]"

S="${WORKDIR}/cpg1.6.x-${PV}"

need_httpd_cgi

src_install() {
	webapp_src_preinst

	dodoc CHANGELOG.txt README.txt
	rm -rf CHANGELOG.txt README.txt

	insinto "${MY_HTDOCSDIR}"
	doins -r .

	dodir "${MY_HTDOCSDIR}"/albums/{userpics,edit}
	webapp_serverowned "${MY_HTDOCSDIR}"/albums{,/userpics,/edit}
	webapp_serverowned "${MY_HTDOCSDIR}"/include

	webapp_postinst_txt en "${FILESDIR}"/postinstall-en.txt
	webapp_src_install
}
