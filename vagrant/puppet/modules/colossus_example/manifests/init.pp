class colossus_example {
  require java
  require iptables::off

  $files_base_dir = "puppet:///modules/colossus_example"

  package { "telnet":
    ensure => "installed",
  }

  file { "/var/colossus_example":
    ensure => directory,
    owner => vagrant,
    group => vagrant,
  }

  file { "/var/colossus_example/logs":
    ensure => directory,
    owner => vagrant,
    group => vagrant,
    require => File["/var/colossus_example"],
  }

  file { "/etc/init.d/colossus-example":
    ensure => present,
    source => "${files_base_dir}/colossus_example_init_script",
    mode => 755,
  }

  exec { "start-colossus-example":
    command => "service colossus-example start &",
    require => [File["/var/colossus_example/logs"], File["/etc/init.d/colossus-example"] ],
  }

}