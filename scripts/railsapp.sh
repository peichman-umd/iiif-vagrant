#!/bin/bash

source $HOME/.rvm/bin/rvm
cd /apps/iiif/pcdm-manifests
gem install bundler
bundle install
