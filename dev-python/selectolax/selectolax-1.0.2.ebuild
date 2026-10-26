EAPI=8

PYTHON_COMPAT=( python3_{12..15} )
DISTUTILS_USE_PEP517=setuptools
DISTUTILS_EXT=1

inherit pypi distutils-r1

DESCRIPTION="Fast HTML5 parser with CSS selectors"
HOMEPAGE="https://github.com/rushter/selectolax"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cython"

RESTRICT="mirror test"

BDEPEND="cython? ( dev-python/cython[${PYTHON_USEDEP}] )"
