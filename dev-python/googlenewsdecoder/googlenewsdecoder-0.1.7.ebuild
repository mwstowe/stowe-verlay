# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} pypy3 )

inherit pypi distutils-r1

DESCRIPTION="Google News Decoder"
HOMEPAGE="https://pypi.org/project/googlenewsdecoder/"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")" 

S=${WORKDIR}/${P}

RESTRICT="mirror"
LICENSE="MIT License"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	$(python_gen_any_dep '
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/urllib3[${PYTHON_USEDEP}]
		dev-python/selectolax[${PYTHON_USEDEP}]
		')
"
DEPEND="${RDEPEND}
	"
BDEPEND="${PYTHON_DEPS}
	virtual/pkgconfig
	"
