class kvmcluster::configure::network (
    $bonds      =   $::kvmcluster::network_bonds,
    $slaves     =   $::kvmcluster::network_slaves,
) { 
    file { "/etc/udev/rules.d/70-persistent-net.rules": 
        ensure  =>  present,
        owner   =>  root,
        group   =>  root,
        mode    =>  0644,
        content =>  template('kvmcluster/persistent-net-rules.erb'),
        before  =>  [ Class["::network::bond::static"], Class["::network::bond::slave"] ],
    }
    
    create_resources('::network::bond::static', $bonds, {
        ensure      =>  'up',
        ipv6init    =>  false,
        mtu         =>  9000,
        bonding_opt =>  'mode=active-backup', 
    })

    create_resources('::network::bond::slave', $slaves, {
        ethtool_opts => 'autoneg off speed 1000 duplex full',
    })

    file { [ "/etc/libvirt/qemu/networks/default.xml",
        "/etc/libvirt/qemu/networks/autostart/default.xml" ]: 
        ensure  =>  absent,
        require =>  Package[libvirt],
        notify  =>  Service[libvirtd],
    }
}
