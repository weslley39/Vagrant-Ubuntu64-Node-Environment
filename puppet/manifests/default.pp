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

class nodepackages {
    exec { "gulp":
      command => "sudo npm install -g gulp",
      path => ["/bin", "/usr/bin"],
      require => Exec["install_node"],
    }
    exec { "forever":
      command => "sudo npm install -g forever",
      path => ["/bin", "/usr/bin"],
      require => Exec["install_node"],
    }
    exec { "bower":
      command => "sudo npm install -g bower",
      path => ["/bin", "/usr/bin"],
      require => Exec["install_node"],
    }
    exec { "supervisor":
      command => "sudo npm install -g supervisor",
      path => ["/bin", "/usr/bin"],
      require => Exec["install_node"],
    }
    exec { "node-inspector":
      command => "sudo npm install -g node-inspector",
      path => ["/bin", "/usr/bin"],
      require => Exec["install_node"],
    }
    exec { "grunt-cli":
      command => "sudo npm install -g grunt-cli",
      path => ["/bin", "/usr/bin"],
      require => Exec["install_node"],
    }
    exec { "yo":
      command => "sudo npm install -g yo",
      path => ["/bin", "/usr/bin"],
      require => Exec["install_node"],
    }
}

class nodejs {
  exec { "git_clone_n":
    command => "git clone https://github.com/visionmedia/n.git /home/vagrant/n",
    path => ["/bin", "/usr/bin"],
    require => [Exec["aptGetUpdate"], Package["git"], Package["curl"], Package["g++"]]
  }

  exec { "install_n":
    command => "make install",
    path => ["/bin", "/usr/bin"],
    cwd => "/home/vagrant/n",
    require => Exec["git_clone_n"]
  }

  exec { "install_node":
    command => "n stable",
    path => ["/bin", "/usr/bin", "/usr/local/bin"],  
    require => [Exec["git_clone_n"], Exec["install_n"]]
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
include nodejs
include nodepackages
include mongodb
