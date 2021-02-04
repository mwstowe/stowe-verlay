# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} pypy3 )

inherit python-any-r1

DESCRIPTION="nameparser library for Python"
HOMEPAGE="https://pypi.org/project/nameparser/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT License"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
"
DEPEND="${RDEPEND}
	$(python_gen_any_dep '
		dev-python/setuptools[${PYTHON_USEDEP}]
		')
	"
BDEPEND="${PYTHON_DEPS}
	virtual/pkgconfig
	"
