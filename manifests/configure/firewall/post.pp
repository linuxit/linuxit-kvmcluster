class kvmcluster::configure::firewall::post {
  
    firewall { "998 deny all other requests":
        action   => 'reject',
        proto    => 'all',
        reject   => 'icmp-host-prohibited',
        before   => undef,
    }
  
    firewall { "999 deny all other requests":
        chain    => 'FORWARD',
        action   => 'reject',
        proto    => 'all',
        reject   => 'icmp-host-prohibited',
        before   => undef,
    }
}
