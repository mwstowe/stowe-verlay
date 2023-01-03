# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} pypy3 )

inherit python-r1

DESCRIPTION="Unifi API library for Python"
HOMEPAGE="https://pypi.org/project/pyunifi/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT License"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

PATCHES=(
	"${FILESDIR}/${P}.patch"
	)

RDEPEND="
	$(python_gen_any_dep '
		dev-python/urllib3[${PYTHON_USEDEP}]
		')
"
DEPEND="${RDEPEND}
	"
BDEPEND="${PYTHON_DEPS}
	virtual/pkgconfig
	"

