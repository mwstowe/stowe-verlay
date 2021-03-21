# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_7 python3_8 python3_9 )
inherit distutils-r1

DESCRIPTION="Library with helpers for the jsonlines file format"
HOMEPAGE="https://pypi.org/project/jsonlines/"
SRC_URI="https://files.pythonhosted.org/packages/90/cd/0beacbcfdf9b3af9e7c615cb3dba7ec4be1030d4b283e3c9717e3fd9af3c/jsonlines-1.2.0.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=( "${DEPEND}"
    "dev-python/future[${PYTHON_USEDEP}]"
	"dev-python/requests[${PYTHON_USEDEP}]"
	"dev-python/pyyaml[${PYTHON_USEDEP}]"
	"dev-python/jsonlines[${PYTHON_USEDEP}]")
BDEPEND=""

python_prepare_all() {
	sed -r -e "/packages *=/ s|\[[^]]*\]\+||" -i -- setup.py

	distutils-r1_python_prepare_all
}
