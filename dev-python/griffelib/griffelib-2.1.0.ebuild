# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# Copied verbatim from the ::guru overlay (dev-python/griffelib-2.1.0),
# guru commit 0b6f47fdf91cbb2cd67ba8556e20aff3d45bae01 (2026-08-23). Unmodified. Original copyright retained above.
#

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..15} )

inherit distutils-r1

MY_PN="griffe"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Signatures for entire Python programs"
HOMEPAGE="
	https://mkdocstrings.github.io/griffe
	https://github.com/mkdocstrings/griffe
	https://pypi.org/project/griffelib/
"
SRC_URI="https://github.com/mkdocstrings/${MY_PN}/archive/${PV}.tar.gz -> ${MY_P}.gh.tar.gz"
S="${WORKDIR}/${MY_P}/packages/griffelib"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

# pdm-backend is used by scripts/get_version.py
BDEPEND="
	dev-python/pdm-backend[${PYTHON_USEDEP}]
	test? (
		>=dev-python/jsonschema-4.18[${PYTHON_USEDEP}]
	)
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

EPYTEST_IGNORE=(
	# requires mkdocstrings
	tests/test_api.py
	# requires griffecli
	tests/test_git.py
)

src_prepare() {
	distutils-r1_src_prepare

	# docs/schema.json for tests/test_encoders.py
	ln -s ../../docs || die
}
