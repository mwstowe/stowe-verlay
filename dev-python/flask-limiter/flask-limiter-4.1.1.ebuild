EAPI=8

REALNAME="flask_limiter"
REALVERSION="${PV}"
PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling

inherit pypi distutils-r1

DESCRIPTION="Rate limiting for Flask applications."
HOMEPAGE="https://pypi.org/project/Flask-Limiter/"
LICENSE="MIT"
SRC_URI="https://files.pythonhosted.org/packages/source/${REALNAME::1}/${REALNAME}/${REALNAME}-${REALVERSION}.tar.gz"
RESTRICT="test"

SLOT="0"
KEYWORDS="~amd64 ~x86"

BDEPEND="dev-python/hatch-vcs[${PYTHON_USEDEP}]"
RDEPEND="dev-python/flask[${PYTHON_USEDEP}]
	>=dev-python/limits-3.13[${PYTHON_USEDEP}]
	>=dev-python/ordered-set-4[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.3[${PYTHON_USEDEP}]"
