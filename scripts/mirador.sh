#!/bin/bash

MIRADOR_VERSION=1.1.0
MIRADOR_BRANCH=1.1.0

mkdir -p /apps/iiif/mirador-static
cd /apps/iiif/mirador-static
git clone file:///apps/git/mirador-static "$MIRADOR_VERSION"
cd "$MIRADOR_VERSION"
git checkout "$MIRADOR_BRANCH"

ln -sf /apps/iiif/mirador-static/${MIRADOR_VERSION} /apps/iiif/apache/html/viewer/${MIRADOR_VERSION}
