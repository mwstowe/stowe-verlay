# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Commercial chapter marking and cutting scripts using comskip"
HOMEPAGE="https://github.com/BrettSheleski/comchap"

COMMIT="dd7db30c258e965f282ac78825971dd0703a031e"
SRC_URI="https://github.com/BrettSheleski/comchap/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"

RDEPEND="
	media-video/comskip
	media-video/ffmpeg
"

src_install() {
	dobin comchap comcut
	dodoc README.md
}
