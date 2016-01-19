class kvmcluster::configure {
    class { '::kvmcluster::configure::network': }
    class { '::kvmcluster::configure::firewall': }
    class { '::kvmcluster::configure::host': }
    class { '::kvmcluster::configure::ssh': }
}
