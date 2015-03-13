# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-r3 eutils python flag-o-matic

DESCRIPTION="remotely execute commands on Windows NT/2000/XP/2003 systems, with lmhash passthrough support"
HOMEPAGE="http://sourceforge.net/projects/winexe/"
EGIT_REPO_URI="http://git.code.sf.net/p/winexe/winexe-waf"
EGIT_BRANCH="master"
# EGIT_COMMIT="a1b3526c2272e9308da7e5438efc7f5228afe484"
EGIT_COMMIT="b787d2a2c4b1abc3653bad10aec943b8efcd7aab"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="net-libs/gnutls
	dev-libs/popt
	dev-libs/cyrus-sasl
	>=net-fs/samba-4.0.0"
RDEPEND="${DEPEND}"

#This probably should be merged into the samba ebuild on a useflag

pkg_setup() {
        python_set_active_version 2
        python_pkg_setup
}

src_prepare() {
#	epatch "${FILESDIR}"/winexe-passthrough.patch
#	epatch "${FILESDIR}"/make-proto.pl.patch
	echo .
}
src_configure() {
	cd source
	filter-flags -march=prescott
	./waf configure
}
src_compile() {
	cd source
	./waf build
}
src_install() {
	dobin "${S}"/source/build/winexe
	doman "${S}"/source/winexe.1
}
