# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{3_7,3_8,3_9} )

inherit multilib git-r3 epatch python-single-r1

DESCRIPTION="UniFi Monitoring Plugin for Nagios/Icinga"
HOMEPAGE="https://github.com/msweetser/check_unifi/"
EGIT_REPO_URI="https://github.com/msweetser/check_unifi.git"
EGIT_BRANCH="master"
EGIT_COMMIT="6766a1e"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="dev-python/pyunifi"

src_prepare() {
	epatch ${FILESDIR}/${P}.patch
	}

src_install() {
	exeinto /usr/$(get_libdir)/nagios/plugins
	doexe check_unifi

	dodoc README.md
}
