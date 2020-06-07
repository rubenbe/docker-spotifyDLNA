set -x
dbus-daemon --system --fork
pulseaudio --log-level=1 --system &
/librespot-e8ec5feb2260e9d2e3b8bfc927cc5211d626e015/target/release/librespot -n "${LIBRESPOT_NAME:-DLNASpotify}" -b 320 --disable-audio-cache --initial-volume 100 --device-type speaker ${LIBRESPOT_OPTS}&
sleep 1
pulseaudio-dlna --debug ${PULSEAUDIO_DLNA_OPTS}
