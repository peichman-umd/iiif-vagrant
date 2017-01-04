#!/bin/bash

MODWSGI_VERSION=3.4
MODWSGI_TGZ=/apps/dist/mod_wsgi-${MODWSGI_VERSION}.tar.gz
# look for a cached tarball
if [ ! -e "$MODWSGI_TGZ" ]; then
    MODWSGI_PKG_URL=https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/modwsgi/mod_wsgi-${MODWSGI_VERSION}.tar.gz
    curl -Lso "$MODWSGI_TGZ" "$MODWSGI_PKG_URL"
fi
tar xvzf "$MODWSGI_TGZ" --directory /apps

cd /apps/mod_wsgi-${MODWSGI_VERSION}
export LD_RUN_PATH=/apps/python/lib
export LD_LIBRARY_PATH=/apps/python/lib
./configure --with-python=/apps/python/bin/python
make
make install
