#!/bin/bash

SERVICE_USER=vagrant
SERVICE_GROUP=vagrant
LORIS_VERSION=2.0.1

#export PYTHONHOME=/apps/python
#export LD_LIBRARY_PATH=/apps/python/lib

# Loris dependencies
pip install Werkzeug
pip install Pillow
pip install configobj

# filesystem images directory
mkdir -p /apps/iiif/images

cd /apps/loris-${LORIS_VERSION}
python setup.py install \
    --image-cache /apps/iiif/loris/cache \
    --tmp-dir /apps/iiif/loris/tmp \
    --www-dir /apps/iiif/apache/html/loris \
    --log-dir /apps/iiif/loris/logs \
    --config-dir /apps/iiif/loris/conf \
    --info-cache /apps/iiif/loris/cache \
    --source-images /apps/iiif/images \
    --loris-owner "$SERVICE_USER" \
    --loris-group "$SERVICE_GROUP"
