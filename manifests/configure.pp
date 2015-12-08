class kvmcluster::configure {
    class { '::kvmcluster::configure::network': }
    class { '::kvmcluster::configure::firewall': }
}
