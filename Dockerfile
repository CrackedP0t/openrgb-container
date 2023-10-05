FROM ghcr.io/linuxserver/baseimage-kasmvnc:fedora37

LABEL org.opencontainers.image.title="OpenRGB"
LABEL org.opencontainers.image.author="CrackedP0t"
LABEL org.opencontainers.image.version="0.9-1"

COPY /root /

RUN dnf install openrgb i2c-tools bsdtar -y

ADD https://openrgb.org/releases/plugins/effects/release_0.9/OpenRGBEffectsPlugin_0.9_Bookworm_64_f1411e1.so /defaults/OpenRGB/plugins/
ADD https://openrgb.org/releases/plugins/visualmap/release_0.9/OpenRGBVisualMapPlugin_0.9_Bookworm_64_bbf30c4.so /defaults/OpenRGB/plugins/
ADD https://openrgb.org/releases/plugins/hardwaresync/release_0.9/OpenRGBHardwareSyncPlugin_0.9_Bookworm_64_dcefdd5.so /defaults/OpenRGB/plugins/

ENV OPENRGB_START_SERVER=no
ENV OPENRGB_SERVER_PORT=6742
ENV OPENRGB_VERBOSE=no
ENV PUID=0
ENV PGID=0