# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

ACCT_USER_ID=-1
ACCT_USER_GROUPS=( calibre )
ACCT_USER_HOME=/var/lib/calibre-web
ACCT_USER_HOME_PERMS=0750

acct-user_add_deps
