# Copyright 2026 Michael Jones
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Performance tracking client for agnost.ai"
HOMEPAGE="https://pypi.org/project/agnost/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/requests-2.25.0[${PYTHON_USEDEP}]
"

# 0.1.13 is excluded by dev-python/unifi-mcp-server (broken import, upstream
# issue #42); 0.1.12 is the last known-good release in the 0.1.x line.
