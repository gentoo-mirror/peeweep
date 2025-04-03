# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit linux-mod-r1

DESCRIPTION="Aicsemi aic8800 Wi-Fi driver"
HOMEPAGE="https://github.com/radxa-pkg/aic8800"
SRC_URI="https://github.com/radxa-pkg/aic8800/archive/refs/tags/3.0+git20240327.3561b08f-4.tar.gz"

S="${WORKDIR}/aic8800-3.0-git20240327.3561b08f-4/src/USB/driver_fw/drivers/aic8800"
LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"

CONFIG_CHECK="~MAC80211 ~BT_HCIBTUSB"

src_prepare(){
	pushd ${WORKDIR}/aic8800-3.0-git20240327.3561b08f-4
		eapply ${WORKDIR}/aic8800-3.0-git20240327.3561b08f-4/debian/patches/fix-sdio-firmware-path.patch
		eapply ${WORKDIR}/aic8800-3.0-git20240327.3561b08f-4/debian/patches/fix-sdio-fall-through.patch
		eapply ${WORKDIR}/aic8800-3.0-git20240327.3561b08f-4/debian/patches/fix-debug-file-with-no-debug-symbols.patch
		eapply ${WORKDIR}/aic8800-3.0-git20240327.3561b08f-4/debian/patches/fix-pcie-build.patch
		eapply ${WORKDIR}/aic8800-3.0-git20240327.3561b08f-4/debian/patches/fix-pcie-firmware-path.patch
		eapply ${WORKDIR}/aic8800-3.0-git20240327.3561b08f-4/debian/patches/fix-usb-firmware-path.patch
		eapply ${WORKDIR}/aic8800-3.0-git20240327.3561b08f-4/debian/patches/fix-linux-6.1-build.patch
		eapply ${WORKDIR}/aic8800-3.0-git20240327.3561b08f-4/debian/patches/fix-aic_btusb.patch
		eapply ${WORKDIR}/aic8800-3.0-git20240327.3561b08f-4/debian/patches/fix-linux-6.7-build.patch
		eapply ${WORKDIR}/aic8800-3.0-git20240327.3561b08f-4/debian/patches/fix-linux-6.5-build.patch
		eapply ${WORKDIR}/aic8800-3.0-git20240327.3561b08f-4/debian/patches/fix-linux-6.9-build.patch
		eapply ${WORKDIR}/aic8800-3.0-git20240327.3561b08f-4/debian/patches/0001-fix-workaround-a-double-free-bug.patch
		eapply ${WORKDIR}/aic8800-3.0-git20240327.3561b08f-4/debian/patches/fix-unreferenced-variable.patch
		eapply ${WORKDIR}/aic8800-3.0-git20240327.3561b08f-4/debian/patches/fix-linux-6.12-build.patch
		eapply ${WORKDIR}/aic8800-3.0-git20240327.3561b08f-4/debian/patches/fix-linux-6.13-build.patch
		eapply ${FILESDIR}/aic8800-3.0-fix.patch
	popd
	default
}

src_compile() {
	MODULES_MAKEARGS+=(
		KDIR="${KV_OUT_DIR}"
	)
	emake "${MODULES_MAKEARGS[@]}"
}

src_install() {
	linux_moduleinto kernel/drivers/net/wireless/${PN}
	linux_domodule aic8800_fdrv/aic8800_fdrv.ko aic_load_fw/aic_load_fw.ko
	modules_post_process
}
