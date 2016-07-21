#!/bin/bash

SERVICE_USER_GROUP=vagrant:vagrant

PYTHON_VERSION=2.7.12
PYTHON_TGZ=/apps/dist/Python-${PYTHON_VERSION}.tar.gz
# look for a cached tarball
if [ ! -e "$PYTHON_TGZ" ]; then
    PYTHON_PKG_URL=https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz
    curl -Lso "$PYTHON_TGZ" "$PYTHON_PKG_URL"
fi
tar xvzf "$PYTHON_TGZ" --directory /apps
PYTHON_SRC=/apps/Python-${PYTHON_VERSION}
PYTHONHOME=/apps/python

cd "$PYTHON_SRC"
./configure --prefix "$PYTHONHOME" --enable-shared --with-ensurepip=install
make
make install

# see http://stackoverflow.com/a/31364237/5124907
cat >> /home/vagrant/.bashrc <<END
export PATH=${PYTHONHOME}/bin:\$PATH
export LD_LIBRARY_PATH=${PYTHONHOME}/lib
END

# change owner so that the service user can install libraries using pip
# this avoids issues of python finding the wrong shared library path
# when executing under sudo
chown -R "$SERVICE_USER_GROUP" "$PYTHONHOME"
