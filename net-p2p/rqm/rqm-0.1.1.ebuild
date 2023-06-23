# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aes-0.7.5
	android-tzdata-0.1.1
	android_system_properties-0.1.5
	atty-0.2.14
	autocfg-1.1.0
	base64-0.13.1
	base64-0.21.2
	bitflags-1.3.2
	block-buffer-0.9.0
	block-modes-0.8.1
	block-padding-0.2.1
	bumpalo-3.13.0
	byteorder-1.4.3
	bytes-1.4.0
	cc-1.0.79
	cfg-if-1.0.0
	chrono-0.4.26
	cipher-0.3.0
	clap-3.2.25
	clap_derive-3.2.25
	clap_lex-0.2.4
	configparser-3.0.2
	cookie-0.16.2
	cookie_store-0.16.1
	core-foundation-0.9.3
	core-foundation-sys-0.8.4
	cpufeatures-0.2.7
	crc-any-2.4.3
	debug-helper-0.3.13
	des-0.7.0
	digest-0.9.0
	encoding_rs-0.8.32
	errno-0.3.1
	errno-dragonfly-0.1.2
	fastrand-1.9.0
	fern-0.6.2
	fnv-1.0.7
	foreign-types-0.3.2
	foreign-types-shared-0.1.1
	form_urlencoded-1.1.0
	futures-channel-0.3.28
	futures-core-0.3.28
	futures-io-0.3.28
	futures-sink-0.3.28
	futures-task-0.3.28
	futures-util-0.3.28
	generic-array-0.14.7
	h2-0.3.19
	hashbrown-0.12.3
	heck-0.4.1
	hermit-abi-0.1.19
	hermit-abi-0.2.6
	hermit-abi-0.3.1
	http-0.2.9
	http-body-0.4.5
	httparse-1.8.0
	httpdate-1.0.2
	hyper-0.14.26
	hyper-tls-0.5.0
	iana-time-zone-0.1.56
	iana-time-zone-haiku-0.1.2
	idna-0.2.3
	idna-0.3.0
	indexmap-1.9.3
	instant-0.1.12
	io-lifetimes-1.0.11
	ipnet-2.7.2
	itoa-1.0.6
	js-sys-0.3.63
	json-0.12.4
	lazy_static-1.4.0
	libc-0.2.144
	linux-raw-sys-0.3.8
	log-0.4.18
	magic-crypt-3.1.12
	matches-0.1.10
	md-5-0.9.1
	memchr-2.5.0
	mime-0.3.17
	mio-0.8.8
	native-tls-0.2.11
	num-traits-0.2.15
	num_cpus-1.15.0
	once_cell-1.17.2
	opaque-debug-0.3.0
	openssl-0.10.54
	openssl-macros-0.1.1
	openssl-probe-0.1.5
	openssl-sys-0.9.88
	os_str_bytes-6.5.0
	percent-encoding-2.2.0
	pin-project-lite-0.2.9
	pin-utils-0.1.0
	pkg-config-0.3.27
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro2-1.0.59
	psl-types-2.0.11
	publicsuffix-2.2.3
	quote-1.0.28
	redox_syscall-0.3.5
	reqwest-0.11.18
	rustix-0.37.19
	ryu-1.0.13
	schannel-0.1.21
	security-framework-2.9.1
	security-framework-sys-2.9.0
	serde-1.0.163
	serde_derive-1.0.163
	serde_json-1.0.96
	serde_urlencoded-0.7.1
	sha2-0.9.9
	slab-0.4.8
	socket2-0.4.9
	strsim-0.10.0
	syn-1.0.109
	syn-2.0.18
	tempfile-3.5.0
	termcolor-1.2.0
	textwrap-0.16.0
	tiger-0.1.0
	time-0.1.45
	time-0.3.21
	time-core-0.1.1
	time-macros-0.2.9
	tinyvec-1.6.0
	tinyvec_macros-0.1.1
	tokio-1.28.2
	tokio-native-tls-0.3.1
	tokio-util-0.7.8
	tower-service-0.3.2
	tracing-0.1.37
	tracing-core-0.1.31
	try-lock-0.2.4
	typenum-1.16.0
	unicode-bidi-0.3.13
	unicode-ident-1.0.9
	unicode-normalization-0.1.22
	url-2.3.1
	vcpkg-0.2.15
	version_check-0.9.4
	want-0.3.0
	wasi-0.10.0+wasi-snapshot-preview1
	wasi-0.11.0+wasi-snapshot-preview1
	wasm-bindgen-0.2.86
	wasm-bindgen-backend-0.2.86
	wasm-bindgen-futures-0.4.36
	wasm-bindgen-macro-0.2.86
	wasm-bindgen-macro-support-0.2.86
	wasm-bindgen-shared-0.2.86
	web-sys-0.3.63
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows-0.48.0
	windows-sys-0.42.0
	windows-sys-0.45.0
	windows-sys-0.48.0
	windows-targets-0.42.2
	windows-targets-0.48.0
	windows_aarch64_gnullvm-0.42.2
	windows_aarch64_gnullvm-0.48.0
	windows_aarch64_msvc-0.42.2
	windows_aarch64_msvc-0.48.0
	windows_i686_gnu-0.42.2
	windows_i686_gnu-0.48.0
	windows_i686_msvc-0.42.2
	windows_i686_msvc-0.48.0
	windows_x86_64_gnu-0.42.2
	windows_x86_64_gnu-0.48.0
	windows_x86_64_gnullvm-0.42.2
	windows_x86_64_gnullvm-0.48.0
	windows_x86_64_msvc-0.42.2
	windows_x86_64_msvc-0.48.0
	winreg-0.10.1
"

inherit cargo systemd

DESCRIPTION="rqm"
HOMEPAGE="https://github.com/mwstowe/rqm"
SRC_URI="$(cargo_crate_uris) https://github.com/mwstowe/rqm/archive/refs/tags/v0.1.1.tar.gz"


# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD Boost-1.0 LGPL-3+ MIT Unicode-DFS-2016 Unlicense ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

# rust does not use *FLAGS from make.conf, silence portage warning
# update with proper path to binaries this crate installs, omit leading /
QA_FLAGS_IGNORED="usr/bin/${PN}"


src_install() {
	exeinto /usr/bin
	doexe "${WORKDIR}/${P}/target/release/rqm"

	insinto /etc/rqm
	doins "${WORKDIR}/${P}/rqm.conf.example"

	systemd_dounit "${WORKDIR}/${P}/systemd/rqm.service"
}
