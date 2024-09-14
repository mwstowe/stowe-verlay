# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{10..12} pypy3 )

inherit python-r1

DESCRIPTION="Selectolax HTML Parser"
HOMEPAGE="https://pypi.org/project/googlenewsdecoder/"
#SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"
SRC_URL="https://files.pythonhosted.org/packages/d1/17/ebedb00850b58e0cfdb0d4be22084a20b37f33d1b6f6e95e375877017acd/selectolax-0.3.21.tar.gz"

LICENSE="MIT License"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	$(python_gen_any_dep '
		')
"
DEPEND="${RDEPEND}
	"
BDEPEND="${PYTHON_DEPS}
	virtual/pkgconfig
	"
