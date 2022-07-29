# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Super Symlink Manager"
HOMEPAGE="https://github.com/peeweep/supersm"
if [[ "${PV}" != *9999 ]] ; then
	SRC_URI="https://github.com/peeweep/supersm/archive/${PV}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/${P}"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/peeweep/supersm"
fi

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~loong ~m68k ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE="+clang"

DEPEND="dev-libs/boost"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-util/cmake
	clang? ( sys-devel/clang:= )
"

src_configure() {
	local mycmakeargs=()
	if use clang;then
		mycmakeargs+=(
			-DCMAKE_CXX_COMPILER=${CHOST}-clang++
			-DCMAKE_C_COMPILER=${CHOST}-clang
		)
	fi

	cmake_src_configure
}
