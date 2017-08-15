#/bin/bash

curl --silent --location https://rpm.nodesource.com/setup_6.x | sudo bash -

wget http://springdale.math.ias.edu/data/puias/unsupported/7/x86_64/http-parser-2.7.1-3.sdl7.x86_64.rpm
rpm -Uvh http-parser-2.7.1-3.sdl7.x86_64.rpm

# install NodeJS to support Rails asset pipeline
yum install -y --enablerepo=epel nodejs-6.11.1-1.el7 npm
