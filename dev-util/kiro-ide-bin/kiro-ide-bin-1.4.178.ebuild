# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop xdg-utils

DESCRIPTION="Kiro IDE - AI-powered development environment by AWS"
HOMEPAGE="https://kiro.dev/"

SRC_URI="https://prod.download.desktop.kiro.dev/releases/stable/linux-x64/signed/${PV}/tar/kiro-ide-${PV}-stable-linux-x64.tar.gz"
S="${WORKDIR}"

LICENSE="Kiro"
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE="ms-auth"
RESTRICT="mirror strip bindist"

RDEPEND="
	>=sys-libs/glibc-2.39
	app-accessibility/at-spi2-core
	dev-libs/expat
	dev-libs/nss
	media-libs/alsa-lib
	media-libs/mesa
	net-print/cups
	x11-libs/cairo
	x11-libs/gtk+:3
	x11-libs/libdrm
	x11-libs/libX11
	x11-libs/libxcb
	x11-libs/libXcomposite
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libxkbcommon
	x11-libs/libxkbfile
	x11-libs/libXrandr
	x11-libs/pango
	ms-auth? (
		app-crypt/libsecret
		net-libs/libsoup:3.0
		net-libs/webkit-gtk:4.1
	)
"

QA_PREBUILT="*"

src_prepare() {
	default
	# Remove bundled arm64 binaries (wrong arch, causes QA warnings).
	# Guard on existence so an upstream layout change surfaces as a hard
	# failure instead of being silently swallowed by `rm -rf`.
	local arm64_dir="Kiro/resources/app/extensions/kiro.kiro-agent/node_modules/onnxruntime-node/bin/napi-v3/linux/arm64"
	if [[ -d ${arm64_dir} ]]; then
		rm -rf "${arm64_dir}" || die
	fi
}

src_install() {
	insinto /opt/kiro
	doins -r Kiro/*

	fperms +x /opt/kiro/kiro
	fperms +x /opt/kiro/bin/kiro
	fperms +x /opt/kiro/chrome_crashpad_handler
	fperms 4755 /opt/kiro/chrome-sandbox

	dosym ../../opt/kiro/bin/kiro /usr/bin/kiro-ide

	newicon Kiro/resources/app/resources/linux/code.png kiro-ide.png

	make_desktop_entry kiro-ide "Kiro" kiro-ide "Development;IDE;" "" \
		"MimeType=text/plain;inode/directory;\nStartupWMClass=kiro"
}
