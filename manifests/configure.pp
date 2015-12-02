class kvmcluster::configure {
    anchor { '::begin': }->
    class { '::kvmcluster::configure::network': }->
    class { '::kvmcluster::configure::firewall': }->
    anchor { '::end': }
}
