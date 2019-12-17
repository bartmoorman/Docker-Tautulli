FROM bmoorman/ubuntu:bionic

ENV TAUTULLI_PORT="8181"

ARG DEBIAN_FRONTEND="noninteractive"

WORKDIR /opt

RUN apt-get update \
 && apt-get install --yes --no-install-recommends \
    curl \
    git \
    python \
    python-pip \
    python-setuptools \
    python-wheel \
 && git clone https://github.com/Tautulli/Tautulli.git \
 && git clone https://github.com/iVirus/JBOPS.git \
 && pip install -r JBOPS/requirements.txt \
 && apt-get autoremove --yes --purge \
 && apt-get clean \
 && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY tautulli/ /etc/tautulli/

VOLUME /config

EXPOSE ${TAUTULLI_PORT}

CMD ["/etc/tautulli/start.sh"]

HEALTHCHECK --interval=60s --timeout=5s CMD curl --head --insecure --silent --show-error --fail "http://localhost:${TAUTULLI_PORT}/" || exit 1
