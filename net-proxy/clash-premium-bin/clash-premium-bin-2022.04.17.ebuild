# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PV="v${PV}"
inherit systemd

DESCRIPTION="Close-sourced pre-built Clash binary with TUN support"
HOMEPAGE="https://github.com/Dreamacro/clash/releases/tag/premium"
SRC_URI="
	amd64?	( https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-amd64-$PV.gz )
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="!net-proxy/clash"
RDEPEND="${DEPEND}"
S=${WORKDIR}

QA_PREBUILT="
	usr/bin/clash
"

src_install() {
	newbin "clash-linux-amd64-${PV}" clash

	systemd_newunit "${FILESDIR}/clash.service" clash.service

	keepdir /etc/clash
}

pkg_postinst() {
	elog
	elog "Follow the instructions of https://github.com/Dreamacro/clash/wiki"
	elog
	elog "You may need to get Country.mmdb file from"
	elog "https://github.com/Dreamacro/maxmind-geoip"
	elog "or"
	elog "https://dev.maxmind.com/geoip/geoip2/geolite2"
	elog
}
