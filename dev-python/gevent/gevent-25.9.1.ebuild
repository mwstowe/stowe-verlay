EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
DISTUTILS_EXT=1

inherit pypi distutils-r1

DESCRIPTION="Coroutine-based network library"
HOMEPAGE="https://pypi.org/project/gevent/"
LICENSE="MIT"
SRC_URI="https://files.pythonhosted.org/packages/source/${PN::1}/${PN}/${PN}-${PV}.tar.gz"
RESTRICT="test"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-libs/libev
	net-dns/c-ares"
RDEPEND="${DEPEND}
	>=dev-python/greenlet-3.2.2[${PYTHON_USEDEP}]
	dev-python/zope-event[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}]
"
BDEPEND="dev-python/cython[${PYTHON_USEDEP}]"
