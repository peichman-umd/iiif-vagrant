Package {
  allow_virtual => false,
}

exec { "IUS release package":
  command => "/usr/bin/rpm -i https://centos7.iuscommunity.org/ius-release.rpm",
  unless  => "/usr/bin/rpm -q ius-release",
  require => Package["epel-release"],
}

# development and troubleshooting tools
package { "vim-enhanced":
  ensure => present,
}
package { "tree":
  ensure => present,
}
package { "lsof":
  ensure => present,
}

# Python, mod_wsgi, and Loris prerequisites
package { "httpd-devel":
  ensure => present,
}
package { "readline-devel":
  ensure => present,
}
package { "zlib-devel":
  ensure => present,
}
package { "bzip2-devel":
  ensure => present,
}
package { "openssl-devel":
  ensure => present,
}
package { "sqlite-devel":
  ensure => present,
}
package { "libjpeg-turbo-devel":
  ensure =>  present,
}
package { "freetype-devel":
  ensure => present,
}
package { "libtiff-devel":
  ensure => present,
}
package { "mod_ssl":
  ensure => present,
}
# need a newer version of Git; use the IUS community repo
# see https://ius.io/
package { "git2u":
  ensure  => present,
  require => Exec["IUS release package"],
}
package { "bc":
  ensure => present,
}
# cloning from GitHub over HTTPS requires updating NSS
package { "nss":
  ensure => present,
}


# Passenger prereqs
package { "epel-release":
  ensure => present,
}
package { "ruby-devel":
  ensure  => present,
  require => Package["epel-release"],
}
package { "rubygem-rake":
  ensure  => present,
  require => Package["epel-release"],
}
package { "rubygem-rack":
  ensure  => present,
  require => Package["epel-release"],
}
package { "libcurl-devel":
  ensure => present,
}

host { 'fcrepolocal':
  ip => '192.168.40.10',
}

host { 'solrlocal':
  ip => '192.168.40.11',
}
