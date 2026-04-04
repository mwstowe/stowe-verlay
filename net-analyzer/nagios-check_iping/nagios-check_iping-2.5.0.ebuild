# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Official plugins for Nagios"
HOMEPAGE="https://nagios-plugins.org/"
SRC_URI="https://github.com/nagios-plugins/nagios-plugins/releases/download/release-2.4.6/nagios-plugins-2.4.6.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm ~arm64 ~hppa ~ppc ppc64 sparc x86"

# Most of the plugins use automagic dependencies, i.e. the plugin will
# get built if the binary it uses is installed. For example, check_snmp
# will be built only if snmpget from net-analyzer/net-snmp[-minimal] is
# installed. End result: most of our runtime dependencies are required
# at build time as well.

# Perl really needs to run during the build...
BDEPEND="${AUTOMAGIC_DEPEND}
	dev-lang/perl"


# Basically everything in net-analyzer/monitoring-plugins collides with
# nagios-plugins. Perl (from BDEPEND) is needed at runtime, too.
RDEPEND="${BDEPEND}
	${DEPEND}
	!net-analyzer/monitoring-plugins"

# At least one test is interactive.
RESTRICT="test"

# These all come from gnulib and the ./configure checks are working as
# intended when the functions aren't present. Bugs 907755 and 924341.
QA_CONFIG_IMPL_DECL_SKIP=(
	statvfs64
	re_set_syntax
	re_compile_pattern
	re_search
	re_match
)

PATCHES=(
  "${FILESDIR}"/check_ping.patch
)

S="${WORKDIR}"/nagios-plugins-2.4.6

src_prepare() {
	default

	# Fix the path to our perl interpreter
	sed -i -e "1s:/usr/local/bin/perl:/usr/bin/perl:" \
		"${S}"/plugins-scripts/*.pl \
		|| die 'failed to fix perl interpreter path'
}

src_configure() {
	# Use an array to prevent econf from mangling the ping args.
	local myconf=()

	myconf+=( --without-openssl )
	myconf+=( --without-gnutls )

	# The autodetection for these two commands can hang if localhost is
	# down or ICMP traffic is filtered (bug #468296). But also the path
	# likes to move around on us (bug #883765).
	myconf+=( --with-ping-command="$(command -v ping) -n -U -w %d -c %d %s" )

	econf \
		"${myconf[@]}" \
		--libexecdir="/usr/$(get_libdir)/nagios/plugins" \
		--sysconfdir="/etc/nagios"
}

src_install() {
    cp -R "${S}/plugins/check_ping" "${S}/plugins/check_iping"
	exeinto ${ROOT}/usr/$(get_libdir)/nagios/plugins
	doexe plugins/check_iping
	}

pkg_postinst() {
	elog
	elog "check_iping is installed in ${ROOT}/usr/$(get_libdir)/nagios/plugins"
}
