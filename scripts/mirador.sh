#!/bin/bash

SERVICE_USER_GROUP=vagrant:vagrant

MIRADOR_VERSION=1.0
MIRADOR_TGZ=/apps/dist/mirador-static-${MIRADOR_VERSION}.tar.gz
# look for a cached tarball
if [ ! -e "$MIRADOR_TGZ" ]; then
    MIRADOR_PKG_URL=https://github.com/umd-lib/mirador-static/archive/v${MIRADOR_VERSION}.tar.gz
    curl -Lso "$MIRADOR_TGZ" "$MIRADOR_PKG_URL"
fi
tar xvzf "$MIRADOR_TGZ" --directory /apps
ln -s /apps/mirador-static-${MIRADOR_VERSION} /apps/iiif/apache/html/viewer

chown -R "$SERVICE_USER_GROUP" /apps/mirador-static-${MIRADOR_VERSION}
