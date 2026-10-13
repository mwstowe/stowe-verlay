EAPI=8

REALNAME="flask_simpleldap"
PYTHON_COMPAT=( python3_{12..15} )
DISTUTILS_USE_PEP517=hatchling

inherit pypi distutils-r1

DESCRIPTION="LDAP authentication extension for Flask"
HOMEPAGE="https://pypi.org/project/flask-simpleldap/"
SRC_URI="https://files.pythonhosted.org/packages/source/${REALNAME::1}/${REALNAME}/${REALNAME}-${PV}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror test"

RDEPEND="
	dev-python/flask[${PYTHON_USEDEP}]
	dev-python/python-ldap[${PYTHON_USEDEP}]
"
