EAPI=8

REALNAME="flask_httpauth"
REALVERSION="${PV}"
PYTHON_COMPAT=( python3_{12..15} )
DISTUTILS_USE_PEP517=setuptools

inherit pypi distutils-r1

DESCRIPTION="HTTP authentication for Flask routes"
HOMEPAGE="https://pypi.org/project/Flask-HTTPAuth/"
SRC_URI="https://files.pythonhosted.org/packages/source/${REALNAME::1}/${REALNAME}/${REALNAME}-${REALVERSION}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror test"

RDEPEND="dev-python/flask[${PYTHON_USEDEP}]"
BDEPEND="${RDEPEND}"
