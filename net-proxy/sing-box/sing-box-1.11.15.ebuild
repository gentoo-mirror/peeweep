# Copyright 2024-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module systemd shell-completion

DESCRIPTION="The universal proxy platform"
HOMEPAGE="https://sing-box.sagernet.org/ https://github.com/SagerNet/sing-box"
SRC_URI="https://github.com/SagerNet/sing-box/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" https://github.com/gentoo-zh/gentoo-deps/releases/download/${P}/${P}-vendor.tar.xz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

IUSE="+quic grpc +dhcp +wireguard +ech +utls +reality +acme +clash-api v2ray-api +gvisor tor"

src_compile() {
	local mybuildtags
	use quic && mybuildtags+="with_quic,"
	use grpc && mybuildtags+="with_grpc,"
	use dhcp && mybuildtags+="with_dhcp,"
	use wireguard && mybuildtags+="with_wireguard,"
	use ech && mybuildtags+="with_ech,"
	use utls && mybuildtags+="with_utls,"
	use reality && mybuildtags+="with_reality_server,"
	use acme && mybuildtags+="with_acme,"
	use clash-api && mybuildtags+="with_clash_api,"
	use v2ray-api && mybuildtags+="with_v2ray_api,"
	use gvisor && mybuildtags+="with_gvisor,"
	use tor && mybuildtags+="with_embedded_tor,"

	ego build -tags "${mybuildtags%,}" \
		-ldflags "-X github.com/sagernet/sing-box/constant.Version=${PV}" \
		./cmd/sing-box
}

src_install() {
	dobin sing-box

	insinto /etc/sing-box
	newins release/config/config.json config.json.example

	systemd_dounit release/config/sing-box{,@}.service
	newinitd release/config/sing-box.initd sing-box

	newbashcomp release/completions/sing-box.bash sing-box
	dofishcomp release/completions/sing-box.fish
	newzshcomp release/completions/sing-box.zsh _sing-box
}
