EAPI=8

REALNAME="flask_dance"
PYTHON_COMPAT=( python3_{12..15} )
DISTUTILS_USE_PEP517=flit

inherit pypi distutils-r1

DESCRIPTION="Doing the OAuth dance with style using Flask, requests, and oauthlib"
HOMEPAGE="https://pypi.org/project/flask-dance/"
SRC_URI="https://files.pythonhosted.org/packages/source/${REALNAME::1}/${REALNAME}/${REALNAME}-${PV}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror test"

RDEPEND="
	dev-python/flask[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/oauthlib[${PYTHON_USEDEP}]
	dev-python/requests-oauthlib[${PYTHON_USEDEP}]
	dev-python/werkzeug[${PYTHON_USEDEP}]
	dev-python/urlobject[${PYTHON_USEDEP}]
"
