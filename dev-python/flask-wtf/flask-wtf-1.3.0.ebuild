EAPI=8

REALNAME="flask_wtf"
REALVERSION="${PV}"
PYTHON_COMPAT=( python3_{12..15} )
DISTUTILS_USE_PEP517=hatchling

inherit pypi distutils-r1

DESCRIPTION="Form rendering, validation, and CSRF protection for Flask with WTForms"
HOMEPAGE="https://pypi.org/project/Flask-WTF/"
SRC_URI="https://files.pythonhosted.org/packages/source/${REALNAME::1}/${REALNAME}/${REALNAME}-${REALVERSION}.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror test"

RDEPEND="dev-python/flask[${PYTHON_USEDEP}]
	dev-python/itsdangerous[${PYTHON_USEDEP}]
	dev-python/wtforms[${PYTHON_USEDEP}]"
BDEPEND="${RDEPEND}"
