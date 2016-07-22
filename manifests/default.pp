Package {
  allow_virtual => false,
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

file { '/apps/iiif':
  ensure => directory,
  owner  => 'vagrant',
  group  => 'vagrant',
}
host { 'fcrepolocal':
  ip => '192.168.40.10',
}
