#!/bin/bash

# https://www.phusionpassenger.com/library/walkthroughs/deploy/ruby/ownserver/apache/oss/el7/install_passenger.html

yum install -y httpd epel-release pygpgme curl nss
REPO_URL=https://oss-binaries.phusionpassenger.com/yum/definitions/el-passenger.repo
curl --fail -sSLo /etc/yum.repos.d/passenger.repo "$REPO_URL" && yum install -y mod_passenger
