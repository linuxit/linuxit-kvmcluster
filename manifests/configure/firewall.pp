class kvmcluster::configure::firewall (
    $bcn_net    =   $::kvmcluster::bcn_network,
    $sn_net     =   $::kvmcluster::sn_network,
    $ifn_net    =   $::kvmcluster::ifn_network,
) { 
    $bonds      =   $::kvmcluster::network_bonds

    resources { "firewall":
        purge => true
    }
  
    Firewall {
        before  => Class['::kvmcluster::configure::firewall::post'],
        require => Class['::kvmcluster::configure::firewall::pre'],
    }
  
    class { ['::kvmcluster::configure::firewall::pre', '::kvmcluster::configure::firewall::post']: }

    class { '::firewall': }

    firewall { '100 corosync': 
        ctstate     =>  NEW,
        proto       =>  udp,
        source      =>  $bcn_net,
        destination =>  $bcn_net,
        dport       =>  [ 5404, 5405 ],
        action =>   'accept',
    }

    firewall { '101 multicast': 
        ctstate  =>  NEW,
        dst_type => 'MULTICAST',
        source   => $bcn_net,
        dport    => [ 5404, 5405 ],
        action =>   'accept',
    }

    firewall { '102 dlm': 
        ctstate     =>  NEW,
        source      =>  $bcn_net,
        destination =>  $bcn_net,
        dport       =>  21064,
        action =>   'accept',
    }

    firewall { '103 ricci': 
        ctstate     =>  NEW,
        source      =>  $bcn_net,
        destination =>  $bcn_net,
        dport       =>  11111,
        action =>   'accept',
    }

    firewall { '104 modclusterd': 
        ctstate     =>  NEW,
        source      =>  $bcn_net,
        destination =>  $bcn_net,
        dport       =>  16851,
        action =>   'accept',
    }

    firewall { '199 igmp': 
        proto  =>   'igmp',
        action =>   'accept',
    }

    # TODO: Should be dynamic for the number of DRBD resources being sync'd
    firewall { '105 drbd': 
        ctstate     =>  NEW,
        source      =>  $sn_net,
        destination =>  $sn_net,
        dport       =>  [ 7788, 7789 ],
        action      =>   'accept',
    }
    
    firewall { '106 KVM live migration': 
        ctstate     =>  NEW,
        source      =>  $bcn_net,
        destination =>  $bcn_net,
        dport       =>  "49152-49216",
        action      =>  "accept",
    }

    # TODO: Missed off the VNC range opening for the moment
}
