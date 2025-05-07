# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="The ability to support openEuler power consumption control"
HOMEPAGE="https://gitee.com/openeuler/powerapi/"
SRC_URI="https://gitee.com/src-openeuler/powerapi/raw/master/${P}.tar.gz"

LICENSE="MulanPSL-2.0"
SLOT="0"
KEYWORDS=""

src_configure() {
	local mycmakeargs=(
		-DRELEASE_MODE="true"
	)
	cmake_src_configure
}
