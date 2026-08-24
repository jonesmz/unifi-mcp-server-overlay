# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# Copied verbatim from the ::guru overlay (dev-python/uncalled-for-0.3.2),
# guru commit 0b6f47fdf91cbb2cd67ba8556e20aff3d45bae01 (2026-08-23). Unmodified. Original copyright retained above.
#

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYPI_VERIFY_REPO=https://github.com/chrisguidry/uncalled-for
PYTHON_COMPAT=( python3_{12..15} )

inherit distutils-r1 pypi

DESCRIPTION="Async dependency injection for Python functions"
HOMEPAGE="
	https://github.com/chrisguidry/uncalled-for
	https://pypi.org/project/uncalled-for/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

EPYTEST_PLUGINS=( pytest-{asyncio,timeout} )
distutils_enable_tests pytest

src_prepare() {
	sed -i -e '/--cov/d' pyproject.toml || die
	distutils-r1_src_prepare
}
