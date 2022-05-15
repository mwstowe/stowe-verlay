# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-apps/coppermine/coppermine-1.5.46.ebuild,v 1.2 2012/06/22 22:17:54 mabi Exp $

EAPI=6

inherit webapp versionator

DESCRIPTION="Web picture gallery written in PHP with a MySQL backend"
HOMEPAGE="http://coppermine.sourceforge.net/"
SRC_URI="https://github.com/coppermine-gallery/cpg1.6.x/archive/v1.6.12.zip"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~sparc ~x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND="virtual/httpd-php
	dev-lang/php[gd,mysql]"

S="${WORKDIR}"/$(version_format_string 'cpg$1.$2.x-$1.$2.$3')

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
