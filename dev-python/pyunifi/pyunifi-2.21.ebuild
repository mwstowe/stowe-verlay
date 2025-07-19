# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} pypy3 )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Unifi API library for Python"
HOMEPAGE="https://pypi.org/project/pyunifi/"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"

S=${WORKDIR}/${P}

LICENSE="MIT License"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

PATCHES=(
	"${FILESDIR}/${P}.patch"
	)

RDEPEND="
	$(python_gen_any_dep '
		dev-python/urllib3[${PYTHON_USEDEP}]
		')
"
DEPEND="${RDEPEND}
	"
BDEPEND="${PYTHON_DEPS}
	virtual/pkgconfig
	"

