#!/bin/bash

SERVICE_USER_GROUP=vagrant:vagrant

LORIS_VERSION=2.0.1
LORIS_TGZ=/apps/dist/loris-${LORIS_VERSION}.tar.gz
# look for a cached tarball
if [ ! -e "$LORIS_TGZ" ]; then
    LORIS_PKG_URL=https://github.com/loris-imageserver/loris/archive/${LORIS_VERSION}.tar.gz
    curl -Lso "$LORIS_TGZ" "$LORIS_PKG_URL"
fi
tar xvzf "$LORIS_TGZ" --directory /apps

# must change owner so that the loris-install script can create
# the Python egg in this directory
chown -R "$SERVICE_USER_GROUP" /apps/loris-${LORIS_VERSION}
