# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# Short one-line description of this package.
DESCRIPTION="The Amazon KIRO CLI tool (formerly known a Q)"

# Homepage, not used by Portage directly but handy for developer reference
HOMEPAGE="https://kiro.dev/docs/cli/"

# Point to any required sources; these will be automatically downloaded by
# Portage.
SRC_URI="https://desktop-release.q.us-east-1.amazonaws.com/latest/kirocli-x86_64-linux.zip"

# Source directory; the dir where the sources can be found (automatically
# unpacked) inside ${WORKDIR}.  The default value for S is ${WORKDIR}/${P}
# If you don't need to change it, leave the S= line out of the ebuild
# to keep it tidy.
S="${WORKDIR}/kirocli"

# License of the package.  Kiro CLI is proprietary Amazon software
# licensed under the Kiro License (https://kiro.dev/license/).
LICENSE="Kiro"

SLOT="0"

KEYWORDS="~amd64"

RESTRICT=mirror

# The .zip archive requires unzip to unpack.
BDEPEND="app-arch/unzip"

# The upstream archive ships pre-stripped binaries; silence the QA notice.
QA_PRESTRIPPED="
	usr/bin/kiro-cli
	usr/bin/kiro-cli-chat
	usr/bin/kiro-cli-term
"

# The following src_configure function is implemented as default by portage, so
# you only need to call it if you need a different behaviour.
src_configure() {
echo
}

# The following src_compile function is implemented as default by portage, so
# you only need to call it, if you need different behaviour.
src_compile() {
echo
}

# The following src_install function is implemented as default by portage, so
# you only need to call it, if you need different behaviour.
src_install() {
	exeinto /usr/bin
	doexe "${WORKDIR}"/kirocli/bin/kiro-cli
	doexe "${WORKDIR}"/kirocli/bin/kiro-cli-chat
	doexe "${WORKDIR}"/kirocli/bin/kiro-cli-term
}
