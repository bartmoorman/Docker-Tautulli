FROM bmoorman/ubuntu:focal

ARG DEBIAN_FRONTEND=noninteractive

ENV TAUTULLI_PORT=8181

WORKDIR /opt

RUN apt-get update \
 && apt-get install --yes --no-install-recommends \
    curl \
    git \
    python3 \
    python3-pip \
    python3-setuptools \
    python3-wheel \
 && git clone --single-branch https://github.com/Tautulli/Tautulli.git \
 && git clone --single-branch https://github.com/blacktwin/JBOPS.git \
 && pip3 install -r JBOPS/requirements.txt \
 && apt-get autoremove --yes --purge \
 && apt-get clean \
 && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY tautulli/ /etc/tautulli/

VOLUME /config

EXPOSE ${TAUTULLI_PORT}

CMD ["/etc/tautulli/start.sh"]

HEALTHCHECK --interval=60s --timeout=5s CMD curl --head --insecure --silent --show-error --fail "http://localhost:${TAUTULLI_PORT}/" || exit 1
