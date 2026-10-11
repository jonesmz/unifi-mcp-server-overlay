# Copyright 2026 Michael Jones
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1

DESCRIPTION="Model Context Protocol (MCP) server for the UniFi Network API"
HOMEPAGE="
	https://github.com/enuno/unifi-mcp-server
	https://pypi.org/project/unifi-mcp-server/
"

# v0.2.6 was tagged on GitHub but never published to PyPI (PyPI stops at
# 0.2.5), and upstream's pyproject.toml for the tag still carries
# version = "0.2.5" (they bumped the tag but not the metadata string).
# Source from the GitHub tag archive rather than the pypi eclass.
SRC_URI="
	https://github.com/enuno/unifi-mcp-server/archive/refs/tags/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="agnost"

# agnost is imported conditionally (performance tracking via agnost.ai); the
# server runs without it. Upstream excludes the broken agnost 0.1.13; this
# overlay only ships dev-python/agnost-0.1.12, so no blocker is needed.
RDEPEND="
	>=dev-python/fastmcp-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.12.5[${PYTHON_USEDEP}]
	>=dev-python/pydantic-settings-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/mcp-1.26.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-46.0.5[${PYTHON_USEDEP}]
	>=dev-python/urllib3-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/authlib-1.6.9[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.12.0[${PYTHON_USEDEP}]
	agnost? (
		>=dev-python/agnost-0.1.12[${PYTHON_USEDEP}]
	)
"

# No tests are shipped in a usable form in the release tarball.
RESTRICT="test"

python_prepare_all() {
	# Upstream tagged v0.2.6 but left pyproject.toml at version = "0.2.5"
	# (and src/__init__.py at 0.2.1). Pin the build-metadata version to the
	# tag so the produced wheel reports ${PV} and PEP517 install is clean.
	sed -i -E "s/^version = \"[0-9.]+\"/version = \"${PV}\"/" pyproject.toml || die
	distutils-r1_python_prepare_all
}
