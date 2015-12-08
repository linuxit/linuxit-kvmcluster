class kvmcluster::params { 
    $name_prefix    = 'lit'

    $node_hostname  = "$name_prefix-${::hostname}"
    $node_number    = 0

    $node_network   = {
        1                       => {
            ipmi                => undef,        
            bcn                 => undef,        
            sn                  => undef,        
            ifn                 => undef,        
            pdu                 => undef,        
            ups                 => undef,        
            network_bond        => {},
            network_bond_bridge => {},
            network_bridge      => {},
            network_slave       => {},
        },
        2 => {
            ipmi                => undef,        
            bcn                 => undef,        
            sn                  => undef,        
            ifn                 => undef,        
            pdu                 => undef,        
            ups                 => undef,        
            network_bond        => {},
            network_bond_bridge => {},
            network_bridge      => {},
            network_slave       => {},
        },
    }

    $ifn_network    = undef
    $sn_network     = undef
    $bcn_network    = undef
}
