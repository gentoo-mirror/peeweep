# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake flag-o-matic xdg

DESCRIPTION="Powerful yet simple to use screenshot software"
HOMEPAGE="https://flameshot.org https://github.com/flameshot-org/flameshot"
SRC_URI="https://github.com/peeweep/flameshot/archive/f4246dc50d45af4b38d299d1574925efa7a015d0.tar.gz"

S="${WORKDIR}/flameshot-f4246dc50d45af4b38d299d1574925efa7a015d0"
LICENSE="Apache-2.0 Free-Art-1.3 GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE="wayland"

BDEPEND="
	dev-qt/qt5compat
	dev-qt/qtsingleapplication
"

src_prepare() {
	rm -r external/singleapplication || die

	cmake_src_prepare
}

src_configure() {
	# -Werror=strict-aliasing
	# https://bugs.gentoo.org/859613
	# https://github.com/flameshot-org/flameshot/issues/3531
	#
	# Do not trust with LTO either
	# append-flags -fno-strict-aliasing
	# filter-lto

	local mycmakeargs=(
		-DUSE_EXTERNAL_SINGLEAPPLICATION=1
		-DENABLE_CACHE=0
		-DUSE_WAYLAND_CLIPBOARD=$(usex wayland)
	)

	cmake_src_configure
}

src_install() {
	cmake_src_install
	dolib.so ${S}_build/external/Qt-Color-Widgets/libQtColorWidgets.so.2.2.0
	dolib.so ${S}_build/external/Qt-Color-Widgets/libQtColorWidgets.so.2
}
