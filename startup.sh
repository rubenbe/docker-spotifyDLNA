#!/bin/bash

set -x

dbus-daemon --system --fork
pulseaudio --log-level=1 --system &
/librespot-0.4.1/target/release/librespot -n "${LIBRESPOT_NAME:-DLNASpotify}" -b 320 --disable-audio-cache --initial-volume 100 --device-type speaker ${LIBRESPOT_OPTS}&
sleep 1
pulseaudio-dlna ${PULSEAUDIO_DLNA_OPTS} &

wait -n

exit $?
