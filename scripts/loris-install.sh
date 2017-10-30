#!/bin/bash

SERVICE_USER=vagrant
SERVICE_GROUP=vagrant
LORIS_VERSION=2.1.0-final

# select the version of Python to install Loris into
export PYENV_VERSION=2.7.12

# Loris dependencies
pip install Werkzeug
pip install Pillow
pip install configobj

# filesystem images directory
mkdir -p /apps/iiif/images

cd /apps/loris-${LORIS_VERSION}
python setup.py install \
    --image-cache /apps/iiif/loris/cache/images \
    --tmp-dir /apps/iiif/loris/tmp \
    --www-dir /apps/iiif/apache/html/images \
    --log-dir /apps/iiif/loris/logs \
    --config-dir /apps/iiif/loris/conf \
    --info-cache /apps/iiif/loris/cache/info \
    --source-images /apps/iiif/images \
    --loris-owner "$SERVICE_USER" \
    --loris-group "$SERVICE_GROUP"

# reset the config file to the one in our iiif-env
cd /apps/iiif
git checkout -- loris/conf/loris2.conf

# Unless Loris Version > 2.0.1, we need to patch the resolver
if [ $LORIS_VERSION = "2.0.1" ]; then
    echo "LORIS_VERSION is 2.0.1 - Patching resolver.py"
    /vagrant/scripts/install-patched-resolver.sh
fi
