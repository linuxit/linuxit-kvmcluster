# == Class: kvmcluster
#
# Full description of class kvmcluster here.
#
# === Parameters
#
# [*name_prefix*]
#   Node hostname prefix
# 
# [*node_number*]
#   Node number in cluster (should be 1 / 2)
# 
# [*network_bonds*]
#   Bond configuration as per razorsedge-network ::network::bond::static
#
# [*network_slaves*]
#   Interface configuration as per razorsedge-network ::network::bond::slave
#
# [*network_names*]
#   Override bcn, sn, ifn network naming for this host
#
class kvmcluster (
    $name_prefix        = $kvmcluster::params::name_prefix,
    $node_number        = $kvmcluster::params::node_number,
    $network_bonds      = {},
    $network_slaves     = {},
    $network_names      = $kvmcluster::params::network_names,
) {
    # TODO: Validate parameters!

    anchor { '::begin': }->
    class { '::kvmcluster::configure': }->
    class { '::kvmcluster::install': }->
    class { '::kvmcluster::service': }->
    anchor { '::end': }
}
