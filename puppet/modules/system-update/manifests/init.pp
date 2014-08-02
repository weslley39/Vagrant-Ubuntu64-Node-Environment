class system-update {
  exec { 'apt-get update':
    command => 'apt-get update',
  }

  $sysPackages = [ "build-essential" ,"git"]
	ensure_resource('package',$sysPackages,{ensure => "installed",require => Exec['apt-get update']})  
}
