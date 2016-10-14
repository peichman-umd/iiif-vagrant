# -*- mode: ruby -*-
# vi: set ft=ruby :

system("scripts/install-trigger-plugin.sh")

Vagrant.configure("2") do |config|

  config.trigger.before :up do
    run  "scripts/host-prereqs.sh"
  end

  config.vm.box = "peichman-umd/ruby"

  config.vm.hostname = 'iiiflocal'

  config.vm.network "private_network", ip: "192.168.40.13"

  config.vm.synced_folder "dist", "/apps/dist"
  config.vm.synced_folder "/apps/git/iiif-env", "/apps/git/iiif-env"
  config.vm.synced_folder "/apps/git/pcdm-manifests", "/apps/iiif/pcdm-manifests"

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

  # Passenger
  config.vm.provision "shell", path: "scripts/passenger.sh", privileged: true
  # Nodejs for rails asset pipeline
  config.vm.provision "shell", path: "scripts/nodejs.sh", privileged: true
  # pcdm-manifests app
  config.vm.provision "shell", path: "scripts/railsapp.sh", privileged: false


  # Apache runtime setup
  config.vm.provision "shell", path: 'scripts/apache.sh'
  # HTTPS certificate for Apache
  config.vm.provision "shell", path: 'scripts/https-cert.sh'

  # server-specific configuration files
  config.vm.provision "file", source: 'files/env', destination: '/apps/iiif/config/env'
  config.vm.provision "file", source: 'files/loris2.conf', destination: '/apps/iiif/loris/conf/loris2.conf'

end
