EAPI=8

REALNAME="${PN}"
REALVERSION="${PV}"
PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
DISTUTILS_EXT=1

inherit pypi distutils-r1

DESCRIPTION="Fast HTML5 parser with CSS selectors."
HOMEPAGE="https://github.com/rushter/selectolax"
LICENSE="MIT"
SRC_URI="https://files.pythonhosted.org/packages/source/${REALNAME::1}/${REALNAME}/${REALNAME}-${REALVERSION}.tar.gz"
RESTRICT="test"

SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="cython"
BDEPEND="cython? ( dev-python/cython[${PYTHON_USEDEP}] )"
