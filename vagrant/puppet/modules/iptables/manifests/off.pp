class iptables::off {

  exec { "iptables-save":
    command => "service iptables save",
  }
  exec { "iptables-stop":
    command => "service iptables stop",
    require => Exec["iptables-save"],
  }
  exec { "iptables-chkconfig-off":
    command => "chkconfig iptables off",
    require => Exec["iptables-stop"],
  }
}