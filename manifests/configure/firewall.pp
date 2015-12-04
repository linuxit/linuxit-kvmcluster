class kvmcluster::configure::firewall (
    bcn_network =>  $::kvmcluster::bcn_network,
    bcn_ip      =>  $::kvmcluster::bcn_ip,
    sn_network  =>  $::kvmcluster::sn_network,
    sn_ip       =>  $::kvmcluster::sn_ip,
    ifn_network =>  $::kvmcluster::ifn_network,
    ifn_ip      =>  $::kvmcluster::ifn_ip,
) { 
    resources { "firewall":
        purge => true
    }
  
    Firewall {
        before  => Class['::kvmcluster::configure::firewall::post'],
        require => Class['::kvmcluster::configure::firewall::pre'],
    }
  
    class { ['::site::profiles::firewall::pre', '::site::profiles::firewall::post']: }

    class { '::firewall': }

    firewall { '100 corosync': 
        ctstate     =>  new,
        proto       =>  udp,
        source      =>  $bcn_net,
        destination =>  $bcn_net,
        dport       =>  [ 5404, 5405 ],
        action =>   'accept',
    }

    firewall { '101 multicast': 
        ctstate  =>  new,
        dst_type => 'MULTICAST',
        source   => $bcn_net,
        dport    => [ 5404, 5405 ],
        action =>   'accept',
    }

    firewall { '102 dlm': 
        ctstate     =>  new,
        source      =>  $bcn_net,
        destination =>  $bcn_net,
        dport       =>  21064,
        action =>   'accept',
    }

    firewall { '103 ricci': 
        ctstate     =>  new,
        source      =>  $bcn_net,
        destination =>  $bcn_net,
        dport       =>  11111,
        action =>   'accept',
    }

    firewall { '104 modclusterd': 
        ctstate     =>  new,
        source      =>  $bcn_net,
        destination =>  $bcn_net,
        dport       =>  16851,
        action =>   'accept',
    }

    firewall { 'igmp': 
        proto  =>   'igmp',
        action =>   'accept',
    }

    # TODO: Should be dynamic for the number of DRBD resources being sync'd
    firewall { '105 drbd': 
        ctstate     =>  new,
        source      =>  $sn_net,
        destination =>  $sn_net,
        dport       =>  [ 7788, 7789 ],
        action      =>   'accept',
    }
    
    firewall { '106 KVM live migration': 
        ctstate     =>  new,
        source      =>  $bcn_net,
        destination =>  $bcn_net,
        dport       =>  "49152-49216",
        action      =>  "accept",
    }

    # TODO: Missed off the VNC range opening for the moment
}
