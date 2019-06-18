# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} pypy2_0 )

inherit eutils python-single-r1 flag-o-matic

DESCRIPTION="remotely execute commands on Windows NT/2000/XP/2003 systems, with lmhash passthrough support"
HOMEPAGE="http://sourceforge.net/projects/winexe/"
# EGIT_REPO_URI="http://git.code.sf.net/p/winexe/winexe-waf"
#EGIT_REPO_URI="http://git.code.sf.net/u/mstowe/winexe"
#EGIT_BRANCH="master"
# EGIT_COMMIT="a1b3526c2272e9308da7e5438efc7f5228afe484"
#EGIT_COMMIT="9f5b8251e85dbdcf44fac4e7613fba800152e41b"
SRC_URI="https://sourceforge.net/p/winexe/bugs/85/attachment/winexe-1.2.tgz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="net-libs/gnutls
	dev-libs/popt
	dev-libs/cyrus-sasl
	>=net-fs/samba-4.0.0"
#	<net-fs/samba-4.3.0"
RDEPEND="${DEPEND}"

#This probably should be merged into the samba ebuild on a useflag

pkg_setup() {
        python-single-r1_pkg_setup
}

src_prepare() {
	echo .
}
src_configure() {
	cd source
	filter-flags -march=prescott
#	./waf configure
}
src_compile() {
	cd source
#	./waf build
    make
}
src_install() {
	dobin "${S}"/winexe
	doman "${S}"/orig/source/winexe.1
}
