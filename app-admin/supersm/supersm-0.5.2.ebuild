# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Super Symlink Manager."
HOMEPAGE="https://github.com/peeweep/supersm"
SRC_URI="https://github.com/peeweep/supersm/archive/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${P}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/boost"
RDEPEND="${DEPEND}"
BDEPEND=""
