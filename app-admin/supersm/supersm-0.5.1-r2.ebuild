# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Super Symlink Manager"
HOMEPAGE="https://code.0x0.ee/peeweep/supersm"
SRC_URI="https://code.0x0.ee/peeweep/supersm/archive/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~riscv"

DEPEND="dev-libs/boost:="
RDEPEND="${DEPEND}"
