EAPI=8

REALNAME="${PN}"
REALVERSION="${PV}"
PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling

inherit pypi distutils-r1

DESCRIPTION="Rate limiting utilities."
HOMEPAGE="https://pypi.org/project/limits/"
LICENSE="MIT"
SRC_URI="https://files.pythonhosted.org/packages/source/${REALNAME::1}/${REALNAME}/${REALNAME}-${REALVERSION}.tar.gz"
RESTRICT="test"

SLOT="0"
KEYWORDS="~amd64 ~x86"

BDEPEND="dev-python/hatch-vcs[${PYTHON_USEDEP}]"
RDEPEND=">=dev-python/deprecated-1.2[${PYTHON_USEDEP}]
	>=dev-python/packaging-21[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]"
