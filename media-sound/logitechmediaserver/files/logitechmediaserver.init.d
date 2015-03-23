#!/sbin/runscript
# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/squeezeboxserver/files/squeezeboxserver.init.d,v 1.1 2009/11/25 22:52:25 lavajoe Exp $

# These fit the Squeezebox Server ebuild and so shouldn't need to be changed;
# user-servicable parts go in /etc/conf.d/squeezeboxserver.
run_dir="/var/run/logitechmediaserver"
pidfile=/var/run/logitechmediaserver/logitechmediaserver.pid
logdir=/var/log/logitechmediaserver
varlibdir=/var/lib/logitechmediaserver
prefsdir=${varlibdir}/prefs
cachedir=${varlibdir}/cache
prefsfile=${prefsdir}/logitechmediaserver.prefs
scuser=logitechmediaserver
scname=logitechmediaserver

depend() {
	need net mysql
}

check_config() {
	if [ ! -d "${run_dir}" ]; then
                mkdir "${run_dir}"
        fi

        # Permission stuff. Should ensure that the daemon user always have write permissions.
        # Quick and ugly but should get the job done.

        chown -R ${scuser}:${scgroup} "${run_dir}"
}

start() {
	check_config
	ebegin "Starting Logitech Media Server"

	cd /
	start-stop-daemon \
		--start --exec /usr/bin/perl /usr/sbin/${scname} \
		--pidfile ${pidfile} \
		--user ${scuser} \
		-- \
		--quiet --daemon \
		--pidfile=${pidfile} \
		--cachedir=${cachedir} \
		--prefsfile=${prefsfile} \
		--prefsdir=${prefsdir} \
		--logdir=${logdir} \
		--audiodir=${SBS_MUSIC_DIR} \
		--playlistdir=${SBS_PLAYLISTS_DIR} \
		${SBS_OPTS}

	eend $? "Failed to start Logitech Media Server"
}

stop() {
	ebegin "Stopping Logitech Media Server"
	start-stop-daemon -o --stop --pidfile ${pidfile}
	eend $? "Failed to stop Logitech Media Server"
}
