#!/bin/bash

# for Vagrant, we need to trust the fcrepolocal cert
# since it is self-signed
# Loris uses Requests, which uses Certifi as its CA trust bundle
pip install certifi
CACERT_PATH=$(python -m certifi)
openssl s_client -connect fcrepolocal:443 \
    | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' \
    >> "$CACERT_PATH"

# ignore openssl complaining about a self-signed cert
# and force a success exit
exit 0
