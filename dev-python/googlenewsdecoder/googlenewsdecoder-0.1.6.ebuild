# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} pypy3 )

inherit pypi distutils-r1

DISTUTILS_USE_PEP517=setuptools

DESCRIPTION="Google News Decoder"
HOMEPAGE="https://pypi.org/project/googlenewsdecoder/"
#SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"
SRC_URL="https://github.com/SSujitX/google-news-url-decoder/archive/refs/tags/0.1.6.zip"

LICENSE="MIT License"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	$(python_gen_any_dep '
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/urllib3[${PYTHON_USEDEP}]
		dev-python/selectolax[${PYTHON_USEDEP}]
		')
"
DEPEND="${RDEPEND}
	"
BDEPEND="${PYTHON_DEPS}
	virtual/pkgconfig
	"
