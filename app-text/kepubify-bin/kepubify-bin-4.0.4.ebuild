# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Fast EPUB to Kobo KEPUB converter"
HOMEPAGE="https://github.com/pgaskin/kepubify"

MY_PV="v${PV}"
SRC_URI="
	amd64? ( https://github.com/pgaskin/kepubify/releases/download/${MY_PV}/kepubify-linux-64bit -> ${P}-amd64 )
	arm64? ( https://github.com/pgaskin/kepubify/releases/download/${MY_PV}/kepubify-linux-arm64 -> ${P}-arm64 )
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="-* ~amd64 ~arm64"
RESTRICT="strip"

QA_PREBUILT="usr/bin/kepubify"

S="${WORKDIR}"

src_install() {
	if use amd64; then
		newbin "${DISTDIR}/${P}-amd64" kepubify
	elif use arm64; then
		newbin "${DISTDIR}/${P}-arm64" kepubify
	fi
}
