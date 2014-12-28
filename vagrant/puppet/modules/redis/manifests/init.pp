class redis {
  $redis_version = "redis-2.8.19"
  $tar_gz = "tar.gz"
  $redis_tar = "${redis_version}.${tar_gz}"
  $redis_url = "http://download.redis.io/releases/${redis_tar}"
  $files_base_dir = "puppet:///modules/redis"

  exec { "download-redis":
    command => "wget $redis_url",
    cwd     => '/tmp',
    creates => "/tmp/${redis_tar}",
  }

  exec { "extract-redis":
    command => "tar xvzf ${redis_tar}",
    cwd     => '/tmp',
    creates => "/tmp/${redis_version}",
    require => Exec["download-redis"],
  }

  exec { "install-redis":
    command => "make install",
    cwd     => "/tmp/${redis_version}",
    unless => "which redis-server",
  }

  file { "/etc/redis":
    ensure => directory,
    owner => vagrant,
    group => vagrant,
  }

  file { "/var/redis":
    ensure => directory,
    owner => vagrant,
    group => vagrant,
  }

  file { "/var/redis/db":
    ensure => directory,
    owner => vagrant,
    group => vagrant,
    require => File["/var/redis"],
  }

  file { "/var/redis/logs":
    ensure => directory,
    owner => vagrant,
    group => vagrant,
    require => File["/var/redis"],
  }

  file { "/etc/redis/redis.conf":
    ensure => present,
    source => "${files_base_dir}/redis.conf",
    require => File["/etc/redis"],
    mode => 755,
  }

  file { "/etc/init.d/redis-server":
    ensure => present,
    source => "${files_base_dir}/redis_init_script",
    require => File["/etc/redis"],
    mode => 755,
  }

  exec { "start-redis":
    command => "service redis-server start &",
    require => [ Exec["install-redis"], File["/etc/init.d/redis-server"], File["/etc/redis/redis.conf"] ],
  }
}