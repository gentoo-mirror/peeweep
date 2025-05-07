# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Thread and IRQ affinity setting GUI and cmd line tool"
HOMEPAGE="https://www.kernel.org/pub/software/utils/tuna"
SRC_URI="https://www.kernel.org/pub/software/utils/${PN}/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
