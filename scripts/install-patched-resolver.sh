#! /bin/bash
#
# The Loris latest (2.0.1) release verion of SimpleHTTPResolver does not allow
# for self-signed ssl certificates on the fcrepolocal. Replace it with the 
# patched version of resolver.py which allows for ssl verification to be disabled.
# 
# The development branch of loris has the option to disable ssl verification.
# The patched resolver.py was created by copying the ssl_verify 
# related code from the develop branch of the loris. 
#
# NOTE: THIS SCRIPT WILL NOT BE NECESSARY WHEN THE NEXT VERSION OF LORIS IS RELEASED.

if [ -d /apps/python/lib/python2.7/site-packages/Loris-2.0.0-py2.7.egg/loris/ ]; then
  cp /vagrant/files/resolver-v2.0.1-patched.py /apps/python/lib/python2.7/site-packages/Loris-2.0.0-py2.7.egg/loris/resolver.py

  if [ -e /apps/python/lib/python2.7/site-packages/Loris-2.0.0-py2.7.egg/loris/resolver.pyc ]; then
    rm /apps/python/lib/python2.7/site-packages/Loris-2.0.0-py2.7.egg/loris/resolver.pyc
  fi
else
  echo "CAN NOT PATCH LORIS RESOLVER!"
  echo "DIRECTORY /apps/python/lib/python2.7/site-packages/Loris-2.0.0-py2.7.egg/loris/ does not exist!"
fi
