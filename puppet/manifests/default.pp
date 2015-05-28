class apt_update {
    exec { "aptGetUpdate":
        command => "sudo apt-get update",
        path => ["/bin", "/usr/bin"]
    }
}

class othertools {
    package { "git":
        ensure => latest,
        require => Exec["aptGetUpdate"]
    }

    package { "curl":
        ensure => present,
        require => Exec["aptGetUpdate"]
    }

    package { "htop":
        ensure => present,
        require => Exec["aptGetUpdate"]
    }

    package { "g++":
        ensure => present,
        require => Exec["aptGetUpdate"]
    }

    package { "python":
        ensure => present,
        require => Exec["aptGetUpdate"]
    }
}



class nodejsconfigs {
  class { '::nodejs':
    manage_package_repo       => false,
    nodejs_dev_package_ensure => 'present',
    npm_package_ensure        => 'present',
  }
  package { "mocha":
    provider => "npm",
    ensure => "present",
  }
  package { "gulp":
    provider => "npm",
    ensure => "present",
  }
  package { "forever":
    provider => "npm",
    ensure => "present",
  }
  package { "bower":
    provider => "npm",
    ensure => "present",
  }
  package { "supervisor":
    provider => "npm",
    ensure => "present",
  }
  package { "node-inspector":
    provider => "npm",
    ensure => "present",
  }
  package { "grunt-cli":
    provider => "npm",
    ensure => "present",
  }
  package { "yo":
    provider => "npm",
    ensure => "present",
  }
}

class mongodb {
  class {'::mongodb::globals':
    manage_package_repo => true,
    bind_ip             => ["127.0.0.1"],
  }->
  class {'::mongodb::server':
    port    => 27017,
    verbose => true,
    ensure  => "present"
  }->
  class {'::mongodb::client': }
}

include apt_update
include othertools
include nodejsconfigs
include mongodb