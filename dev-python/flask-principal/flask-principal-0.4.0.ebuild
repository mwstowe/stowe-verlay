EAPI=8

REALNAME="Flask-Principal"
REALVERSION="${PV}"
PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools

inherit pypi distutils-r1

DESCRIPTION="Identity management for Flask applications."
HOMEPAGE="https://pypi.org/project/Flask-Principal/"
LICENSE="MIT"
SRC_URI="https://files.pythonhosted.org/packages/source/${REALNAME::1}/${REALNAME}/${REALNAME}-${REALVERSION}.tar.gz"
S="${WORKDIR}/${REALNAME}-${REALVERSION}"
RESTRICT="test"

SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/flask[${PYTHON_USEDEP}]
	dev-python/blinker[${PYTHON_USEDEP}]"
BDEPEND="${RDEPEND}"
