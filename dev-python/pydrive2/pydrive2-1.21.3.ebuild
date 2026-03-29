EAPI=8

REALNAME="pydrive2"
PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools

inherit pypi distutils-r1

DESCRIPTION="Google Drive API Python wrapper library, maintained fork of PyDrive"
HOMEPAGE="https://pypi.org/project/pydrive2/"
LICENSE="Apache-2.0"
SRC_URI="https://files.pythonhosted.org/packages/source/${REALNAME::1}/${REALNAME}/${REALNAME}-${PV}.tar.gz"
RESTRICT="test"

SLOT="0"
KEYWORDS="~amd64 ~x86"

BDEPEND="dev-python/setuptools-scm[${PYTHON_USEDEP}]"
RDEPEND="
	dev-python/google-api-python-client[${PYTHON_USEDEP}]
	dev-python/oauth2client[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/pyopenssl[${PYTHON_USEDEP}]
"
