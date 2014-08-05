Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
class setLocale($locale="en_US.UTF-8") {
    file { "/etc/environment":
        content => inline_template("LC_ALL=${locale}")
    }
}

include setLocale
include system-update
include '::mongodb::server'
include redis


class { 'nodejs':
  version => 'stable',
}

package { 'mocha':
  provider => npm,
  ensure => present
}
package { 'gulp':
  provider => npm,
  ensure => present
}
package { 'forever':
  provider => npm,
  ensure => present
}
package { 'bower':
  provider => npm,
  ensure => present
}
package { 'supervisor':
  provider => npm,
  ensure => present
}
package { 'serve':
  provider => npm,
  ensure => present
}
