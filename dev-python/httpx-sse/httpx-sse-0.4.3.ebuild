# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# Copied verbatim from the ::guru overlay (dev-python/httpx-sse-0.4.3),
# guru commit 0b6f47fdf91cbb2cd67ba8556e20aff3d45bae01 (2026-08-23). Unmodified. Original copyright retained above.
#

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Consume Server-Sent Event (SSE) messages with HTTPX"
HOMEPAGE="
	https://github.com/florimondmanca/httpx-sse
	https://pypi.org/project/httpx-sse/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	dev-python/httpx[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	dev-python/wheel[${PYTHON_USEDEP}]
	test? (
		dev-python/starlette[${PYTHON_USEDEP}]
		dev-python/sse-starlette[${PYTHON_USEDEP}]
	)
"

EPYTEST_PLUGINS=( pytest-asyncio )
distutils_enable_tests pytest

python_test() {
	epytest -o addopts=
}
