FROM bmoorman/ubuntu

ARG DEBIAN_FRONTEND="noninteractive"

WORKDIR /opt

RUN apt-get update \
 && apt-get install --yes --no-install-recommends \
    git \
    python \
 && git clone -b nightly https://github.com/JonnyWong16/plexpy.git \
 && apt-get autoremove --yes --purge \
 && apt-get clean \
 && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY tautulli/ /etc/tautulli/

VOLUME /config

EXPOSE 8181

CMD ["/etc/tautulli/start.sh"]
