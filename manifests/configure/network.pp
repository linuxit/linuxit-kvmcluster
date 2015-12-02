class kvmcluster::configure::network (
    $bonds      =   $::kvmcluster::network_bonds,
    $slaves     =   $::kvmcluster::network_slaves,
) { 
    create_resources('::network::bond::static', $bonds, {
        ensure      =>  'up',
        ipv6init    =>  false,
        mtu         =>  9000,
        bonding_opt =>  'mode=active-backup', 
    })

    create_resources('::network::bond::slave', $slaves, {
        ethtool_opts => 'autoneg off speed 1000 duplex full',
    })
}
