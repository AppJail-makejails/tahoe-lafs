ARG FREEBSD_RELEASE

FROM ghcr.io/appjail-makejails/core:${FREEBSD_RELEASE}

ARG PYVER
ARG NO_PKGCLEAN

LABEL org.opencontainers.image.title="tahoe-lafs" \
    org.opencontainers.image.description="Secure, decentralized, fault-tolerant file store" \
    org.opencontainers.image.source="https://github.com/AppJail-makejails/tahoe-lafs" \
    org.opencontainers.image.url="https://github.com/AppJail-makejails/tahoe-lafs" \
    org.opencontainers.image.vendor="DtxdF" \
    org.opencontainers.image.authors="Jesús Daniel Colmenares Oviedo <dtxdf@disroot.org>"

RUN set -xe; \
    \
    pkg update; \
    pkg install py${PYVER}-tahoe-lafs; \
    \
    if [ -z "${NO_PKGCLEAN}" ]; then \
        pkg clean -a; \
        rm -rf /var/cache/pkg/*; \
    fi; \
    rm -rf /var/db/pkg/repos/*

COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
