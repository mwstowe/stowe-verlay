# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# Short one-line description of this package.
DESCRIPTION="The Amazon KIRO CLI tool (formerly known a Q)"

# Homepage, not used by Portage directly but handy for developer reference
HOMEPAGE="https://aws.amazon.com/q/"

# Point to any required sources; these will be automatically downloaded by
# Portage.
SRC_URI="https://desktop-release.q.us-east-1.amazonaws.com/latest/q-x86_64-linux.zip"

RESTRICT=mirror

# Source directory; the dir where the sources can be found (automatically
# unpacked) inside ${WORKDIR}.  The default value for S is ${WORKDIR}/${P}
# If you don't need to change it, leave the S= line out of the ebuild
# to keep it tidy.
S="${WORKDIR}/q"


# License of the package.  This must match the name of file(s) in the
# licenses/ directory.  For complex license combination see the developer
# docs on gentoo.org for details.
LICENSE=""

SLOT="0"

KEYWORDS="~amd64"

#IUSE="gnome X"


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
    mkdir -p ${D}/usr/local/bin
    cp ${WORKDIR}/q/bin/q ${D}/usr/local/bin
    cp ${WORKDIR}/q/bin/qchat ${D}/usr/local/bin
    cp ${WORKDIR}/q/bin/qterm ${D}/usr/local/bin
}
