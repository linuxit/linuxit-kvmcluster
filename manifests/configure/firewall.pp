class kvmcluster::configure::firewall { 
    resources { "firewall":
        purge => true
    }
  
    Firewall {
        before  => Class['::kvmcluster::configure::firewall::post'],
        require => Class['::kvmcluster::configure::firewall::pre'],
    }
  
    class { ['::site::profiles::firewall::pre', '::site::profiles::firewall::post']: }

    class { '::firewall': }
}
