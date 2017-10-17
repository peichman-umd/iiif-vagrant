#!/bin/bash

# https://www.phusionpassenger.com/library/install/apache/install/oss/tarball/
# because Phusion's yum repo doesn't currently work with CentOS 7's curl

PASSENGER_VERSION=5.1.8
PASSENGER_TGZ=/apps/dist/passenger-release-$PASSENGER_VERSION.tar.gz
if [ ! -e "$PASSENGER_TGZ" ]; then
    PASSENGER_PKG_URL=https://github.com/phusion/passenger/archive/release-${PASSENGER_VERSION}.tar.gz
    curl -Lso "$PASSENGER_TGZ" "$PASSENGER_PKG_URL"
fi
tar xvzf "$PASSENGER_TGZ" --directory /apps

PASSENGER_ROOT=/apps/passenger-release-$PASSENGER_VERSION

$PASSENGER_ROOT/bin/passenger-install-apache2-module

cat > /etc/profile.d/passenger.sh <<END
export PATH=$PASSENGER_ROOT/bin:\$PATH
END

cp $PASSENGER_ROOT/buildout/apache2/mod_passenger.so /apps/iiif/apache/modules/
