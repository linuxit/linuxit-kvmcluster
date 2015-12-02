class kvmcluster::params { 
    $name_prefix    = 'lit-'

    $node_hostname  = "$name_prefix-${::hostname}"
    $node_number    = 0

    $network_names  = {
        bcn => "${node_hostname}${node_number}.bcn",
        sn  => "${node_hostname}${node_number}.sn",
        ifn => "${node_hostname}${node_number}.ifn",
    }
}
