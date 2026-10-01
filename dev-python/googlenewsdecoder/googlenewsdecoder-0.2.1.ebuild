# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=uv-build
PYTHON_COMPAT=( python3_{11..14} pypy3 )

inherit pypi distutils-r1

DESCRIPTION="A Python package to decode Google News URLs to their original sources"
HOMEPAGE="https://github.com/SSujitX/google-news-url-decoder"
SRC_URI="$(pypi_sdist_url "${PN}" "${PV}")"

S=${WORKDIR}/${P}

RESTRICT="mirror"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/httpx[${PYTHON_USEDEP}]
	dev-python/h2[${PYTHON_USEDEP}]
	dev-python/socksio[${PYTHON_USEDEP}]
	dev-python/selectolax[${PYTHON_USEDEP}]
"
