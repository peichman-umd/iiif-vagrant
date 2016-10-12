#! /bin/bash

# 1. Ensure iiif-env exists at /apps/git/iiif-env
# if not checkout the iiif-env git repository onto that location

IIIF_ENV_GIT_URL=git@bitbucket.org:umd-lib/iiif-env.git
IIIF_ENV_BRANCH=vagrant
IIIF_ENV_LOCAL_LOCATION=/apps/git/iiif-env

echo "Setting up the prerequisites on the host machine"

echo "1. Ensure iiif-env exists."
if [ -d $IIIF_ENV_LOCAL_LOCATION ]; then
  echo "$IIIF_ENV_LOCAL_LOCATION already exists!"
else
  git clone $IIIF_ENV_GIT_URL $IIIF_ENV_LOCAL_LOCATION -b $IIIF_ENV_BRANCH 
  if [ $? == 0 ]; then
    echo "Cloned $IIIF_ENV_GIT_URL to $IIIF_ENV_LOCAL_LOCATION"
  else
    echo "Failed to clone $IIIF_ENV_GIT_URL to $IIIF_ENV_LOCAL_LOCATION"
    exit 1
  fi
fi

# 2. Ensure pcdm-manifests exists at /apps/git/pcdm-manifests
# if not checkout the pcdm-manifests git repository onto that location

PCDM_MANIFESTS_GIT_URL=git@github.com:umd-lib/pcdm-manifests.git
PCDM_MANIFESTS_BRANCH=develop
PCDM_MANIFESTS_LOCAL_LOCATION=/apps/git/pcdm-manifests

echo "Setting up the prerequisites on the host machine"

echo "2. Ensure pcdm-manifests app exists."
if [ -d $PCDM_MANIFESTS_LOCAL_LOCATION ]; then
  echo "$PCDM_MANIFESTS_LOCAL_LOCATION already exists!"
else
  git clone $PCDM_MANIFESTS_GIT_URL $PCDM_MANIFESTS_LOCAL_LOCATION -b $PCDM_MANIFESTS_BRANCH 
  if [ $? == 0 ]; then
    echo "Cloned $PCDM_MANIFESTS_GIT_URL to $PCDM_MANIFESTS_LOCAL_LOCATION"
  else
    echo "Failed to clone $PCDM_MANIFESTS_GIT_URL to $PCDM_MANIFESTS_LOCAL_LOCATION"
    exit 1
  fi
fi