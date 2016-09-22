# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "puppetlabs/centos-7.0-64-puppet"
  config.vm.box_version = "1.0.1"

  config.vm.hostname = 'iiiflocal'

  config.vm.network "private_network", ip: "192.168.40.13"

  config.vm.synced_folder "dist", "/apps/dist"
  config.vm.synced_folder "/apps/git/iiif-env", "/apps/git/iiif-env"

  # system packages and hosts file
  config.vm.provision "puppet"

  # firewall
  config.vm.provision "shell", path: 'scripts/openports.sh', args: [80, 443]
  # Python
  config.vm.provision "shell", path: 'scripts/python.sh'
  # mod_wsgi
  config.vm.provision "shell", path: 'scripts/modwsgi.sh'
  # Loris
  config.vm.provision "shell", path: 'scripts/loris.sh'
  # install Loris runtime
  config.vm.provision "shell", path: 'scripts/loris-install.sh', privileged: false
  # runtime environment
  config.vm.provision "shell", path: 'scripts/env.sh'
  # Apache runtime setup
  config.vm.provision "shell", path: 'scripts/apache.sh'
  # HTTPS certificate for Apache
  config.vm.provision "shell", path: 'scripts/https-cert.sh'
end
