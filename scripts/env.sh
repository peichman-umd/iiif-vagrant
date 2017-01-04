#!/bin/bash

SERVICE_USER_GROUP=vagrant:vagrant

ENV_SRC_DIR=/apps/git/iiif-env
ENV_TARGET_DIR=/apps/iiif
TEMP_CLONE_DIR=$(mktemp -d)

# this dance is necessary so that the pcdm-manifests app can be mounted as a
# shared folder at /apps/iiif/pcdm-manifests prior to the git clone
# source: http://stackoverflow.com/a/2484349/5124907
git clone --no-checkout --no-hardlinks "file://$ENV_SRC_DIR/.git" "$TEMP_CLONE_DIR"
mv "$TEMP_CLONE_DIR/.git" "$ENV_TARGET_DIR"
rm -rf "$TEMP_CLONE_DIR"
cd "$ENV_TARGET_DIR"
git reset --hard HEAD
chown -R "$SERVICE_USER_GROUP" "$ENV_TARGET_DIR"
