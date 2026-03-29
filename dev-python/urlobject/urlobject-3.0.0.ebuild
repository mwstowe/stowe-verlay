EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools

inherit pypi distutils-r1

DESCRIPTION="A utility class for manipulating URLs"
HOMEPAGE="https://pypi.org/project/urlobject/"
LICENSE="Unlicense"
SRC_URI="https://files.pythonhosted.org/packages/source/${PN::1}/${PN}/${PN}-${PV}.tar.gz"
RESTRICT="test"

SLOT="0"
KEYWORDS="~amd64 ~x86"
