FROM fedora:32
RUN dnf install -y rygel pulseaudio
RUN dnf install -y dbus-daemon procps-ng psmisc net-tools cargo alsa-lib-devel pulseaudio-libs-devel
ADD https://github.com/librespot-org/librespot/archive/e8ec5feb2260e9d2e3b8bfc927cc5211d626e015.tar.gz /librespot.tar.gz
RUN mkdir -p /run/dbus
RUN dnf install -y 'dnf-command(copr)' && \
    dnf -y copr enable cygn/pulseaudio-dlna && \
    dnf install -y pulseaudio-dlna && \
    dnf install -y pulseaudio-utils
RUN tar xf /librespot.tar.gz && \
    cd /librespot-* && \
    cargo build --release --no-default-features --features pulseaudio-backend
RUN sed -i 's/load-module module-native-protocol-unix/load-module module-native-protocol-unix auth-anonymous=1/' /etc/pulse/system.pa
ADD ./removechecks.patch /
RUN dnf install -y patch
RUN patch -p1 < /removechecks.patch
#RUN echo 'load-module module-switch-on-connect' >> /etc/pulse/default.pa \
#    && echo 'load-module module-native-protocol-tcp auth-anonymous=1' >> /etc/pulse/default.pa
ADD ./startup.sh /
CMD /startup.sh
