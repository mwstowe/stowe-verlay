# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{10..12} pypy3 )

inherit python-r1

DESCRIPTION="Google News Decoder"
HOMEPAGE="https://pypi.org/project/googlenewsdecoder/"
#SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"
SRC_URL="https://files.pythonhosted.org/packages/37/69/a65c8f8f75e1320f699dc91810e33d748d74516a30a47d15a69fde6867d9/googlenewsdecoder-0.1.5.tar.gz"

LICENSE="MIT License"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

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
