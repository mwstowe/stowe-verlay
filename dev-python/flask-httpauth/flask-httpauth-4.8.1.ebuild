EAPI=8

REALNAME="flask_httpauth"
REALVERSION="${PV}"
PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools

inherit pypi distutils-r1

DESCRIPTION="HTTP authentication for Flask routes."
HOMEPAGE="https://pypi.org/project/Flask-HTTPAuth/"
LICENSE="MIT"
SRC_URI="https://files.pythonhosted.org/packages/source/${REALNAME::1}/${REALNAME}/${REALNAME}-${REALVERSION}.tar.gz"
RESTRICT="test"

SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/flask[${PYTHON_USEDEP}]"
BDEPEND="${RDEPEND}"
