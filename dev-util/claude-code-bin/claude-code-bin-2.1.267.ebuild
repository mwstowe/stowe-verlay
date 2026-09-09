# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Claude Code - an agentic coding tool from Anthropic"
HOMEPAGE="https://docs.anthropic.com/en/docs/claude-code"

SRC_URI="https://downloads.claude.ai/claude-code-releases/${PV}/linux-x64/claude -> ${P}-linux-x64"

RESTRICT="mirror strip"

S="${WORKDIR}"

LICENSE="Anthropic-TOS"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
DEPEND=""

# The download is a single binary, not an archive
src_unpack() {
	cp "${DISTDIR}/${P}-linux-x64" "${WORKDIR}/claude" || die
}

src_configure() { :; }
src_compile() { :; }

src_install() {
	exeinto /usr/bin
	newexe "${WORKDIR}/claude" claude
}
