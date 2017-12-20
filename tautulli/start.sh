#!/bin/bash
exec $(which python) \
    /opt/plexpy/PlexPy.py \
    --datadir /config \
    --nolaunch
