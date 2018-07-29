# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit multilib git-r3 epatch

DESCRIPTION="Brtfs Monitoring Plugin for Nagios/Icinga"
HOMEPAGE="https://github.com/NETWAYS/check_disk_btrfs"
EGIT_REPO_URI="https://github.com/NETWAYS/check_disk_btrfs.git"
EGIT_BRANCH="master"
EGIT_COMMIT="aa20ecb"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="dev-python/six
		 app-admin/sudo
		 sys-fs/btrfs-progs"

src_prepare() {
	epatch ${FILESDIR}/${P}.patch
	}

src_install() {
	exeinto /usr/$(get_libdir)/nagios/plugins
	doexe check_disk_btrfs

	dodoc README.md
}
