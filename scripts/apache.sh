#!/bin/bash

SERVICE_USER_GROUP=vagrant:vagrant

# runtime environment
mkdir -p /apps/iiif/apache/{bin,logs,run}
mkdir -p /apps/iiif/apache/tmp/cas
chown -R "$SERVICE_USER_GROUP" /apps/iiif/apache

# symlink to system modules
ln -sf /usr/lib64/httpd/modules /apps/iiif/apache/modules

# compile the helper setuid program
cd /apps/iiif/apache/src
make SERVICE_USER=vagrant SERVICE_GROUP=vagrant install
