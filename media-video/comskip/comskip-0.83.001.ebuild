# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="A free commercial detector for TV recordings"
HOMEPAGE="https://github.com/erikkaashoek/Comskip"

COMMIT="a140b6ac8bc8f596729e9052819affc779c3b377"
SRC_URI="https://github.com/erikkaashoek/Comskip/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/Comskip-${COMMIT}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="sdl"

DEPEND="
	media-video/ffmpeg:=
	dev-libs/argtable:0
	sdl? ( media-libs/libsdl2 )
"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

src_prepare() {
	default

	# FFmpeg 7+ (libavcodec 61+) removed ticks_per_frame from AVCodecContext.
	# Replace all occurrences with 1 (the effective value in modern FFmpeg
	# where time_base already accounts for field/frame timing).
	if has_version ">=media-video/ffmpeg-7" ; then
		sed -i \
			-e '/->ticks_per_frame[[:space:]]*=/d' \
			-e 's|is->dec_ctx->ticks_per_frame|1|g' \
			-e 's|is->dec_ctxpar->ticks_per_frame|1|g' \
			mpeg2dec.c || die
	fi

	eautoreconf
}

src_configure() {
	econf
}

src_install() {
	emake DESTDIR="${D}" install
	einstalldocs
}
