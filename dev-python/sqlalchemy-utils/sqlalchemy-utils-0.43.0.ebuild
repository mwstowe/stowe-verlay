EAPI=8

REALNAME="sqlalchemy_utils"
PYTHON_COMPAT=( python3_{12..15} )
DISTUTILS_USE_PEP517=setuptools

inherit pypi distutils-r1

DESCRIPTION="Various utility functions for SQLAlchemy"
HOMEPAGE="https://pypi.org/project/sqlalchemy-utils/"
SRC_URI="https://files.pythonhosted.org/packages/source/${REALNAME::1}/${REALNAME}/${REALNAME}-${PV}.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror test"

RDEPEND=">=dev-python/sqlalchemy-1.4[${PYTHON_USEDEP}]"
