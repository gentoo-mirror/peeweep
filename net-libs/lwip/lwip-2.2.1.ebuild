# Copyright 2021-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="123"
HOMEPAGE="https://cgit.git.savannah.gnu.org/cgit/lwip.git"
SRC_URI="https://github.com/lwip-tcpip/lwip/archive/refs/tags/STABLE-2_2_1_RELEASE.tar.gz -> ${P}.tar.gz"

S=${WORKDIR}/lwip-STABLE-2_2_1_RELEASE/contrib/ports/unix/posixlib
LICENSE="BSD GPL-2"
SLOT="0"
KEYWORDS="~amd64"
