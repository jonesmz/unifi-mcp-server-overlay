# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# Copied verbatim from the ::guru overlay (dev-python/aiofile-3.11.1),
# guru commit 0b6f47fdf91cbb2cd67ba8556e20aff3d45bae01 (2026-08-23). Unmodified. Original copyright retained above.
#

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1

DESCRIPTION="Asynchronous file operations"
HOMEPAGE="
	https://github.com/mosquito/aiofile
	https://pypi.org/project/aiofile/
"
SRC_URI="https://github.com/mosquito/${PN}/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	>=dev-python/caio-0.9.0[${PYTHON_USEDEP}]
"

EPYTEST_PLUGINS=( aiomisc-pytest )
distutils_enable_tests pytest
