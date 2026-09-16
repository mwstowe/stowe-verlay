EAPI=8

REALNAME="${PN}"
REALVERSION="${PV}"
PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools

inherit pypi distutils-r1

DESCRIPTION="A simple Python module for parsing human names into their individual components."
HOMEPAGE="https://github.com/derek73/python-nameparser"
LICENSE="LGPL-3"
SRC_URI="https://files.pythonhosted.org/packages/source/${REALNAME::1}/${REALNAME}/${REALNAME}-${REALVERSION}.tar.gz"
RESTRICT="mirror test"

SLOT="0"
KEYWORDS="~amd64 ~x86"
