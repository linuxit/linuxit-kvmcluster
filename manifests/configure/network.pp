class kvmcluster::configure::network (
    $bond       =   $::kvmcluster::node_network[$::kvmcluster::node_number]['network_bond'],
    $bond_bridge =  $::kvmcluster::node_network[$::kvmcluster::node_number]['network_bond_bridge'],
    $bridge     =   $::kvmcluster::node_network[$::kvmcluster::node_number]['network_bridge'],
    $slave      =   $::kvmcluster::node_network[$::kvmcluster::node_number]['network_slave'],
) { 
#    file { "/etc/udev/rules.d/70-persistent-net.rules": 
#        ensure  =>  present,
#        owner   =>  root,
#        group   =>  root,
#        mode    =>  0644,
#        content =>  template('kvmcluster/persistent-net-rules.erb'),
#    }

    file { [ 
        "/etc/sysconfig/network-scripts/ifcfg-eth0",
        "/etc/sysconfig/network-scripts/ifcfg-eth1",
        "/etc/sysconfig/network-scripts/ifcfg-eth2",
        "/etc/sysconfig/network-scripts/ifcfg-eth3",
        "/etc/sysconfig/network-scripts/ifcfg-eth4",
        "/etc/sysconfig/network-scripts/ifcfg-eth5", ]:
        ensure  =>  absent,
        tag     =>  'ifcfgs',
    }

    File<| tag == 'ifcfgs'  |> -> Network::Bond::Static<| |>

    create_resources('::network::bridge::static', $bridge, {
        ensure =>   'up',
        stp    =>   false,
    })

    create_resources('::network::bond::bridge', $bond_bridge, {
        ensure =>   'up',
    })

    create_resources('::network::bond::static', $bond, {
        ensure      =>  'up',
        ipv6init    =>  false,
        mtu         =>  9000,
        bonding_opts =>  'mode=active-backup', 
    })

    create_resources('::network::bond::slave', $slave, {})

    file { [ "/etc/libvirt/qemu/networks/default.xml",
        "/etc/libvirt/qemu/networks/autostart/default.xml" ]: 
        ensure  =>  absent,
        notify  =>  Service[libvirtd],
    }
}
