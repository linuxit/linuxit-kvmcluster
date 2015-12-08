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
# [*network_bond*]
#   Bond configuration as per razorsedge-network ::network::bond::static
#   (TODO: Use forked version - pull request to add bridge param)
#
# [*network_bond_bridge*] 
#   Bridge in front of bond configuration
#
# [*network_bridge*]
#   Bridge configuration as per razorsedge-network ::network::bridge::static 
#
# [*network_slave*]
#   Interface configuration as per razorsedge-network ::network::bond::slave
#
# [*network_name*]
#   Override bcn, sn, ifn network naming for this host
#
# [*ifn_network*]
#   Network segment address - internet facing
#
# [*sn_network*]
#   Network segment address - storage
#
# [*bcn_network*]
#   Network segment address - back channel
#
#
class kvmcluster (
    $name_prefix        = $kvmcluster::params::name_prefix,
    $node_number        = $kvmcluster::params::node_number,
    $network_bond       = {},
    $network_bond_bridge = {},
    $network_bridge     = {},
    $network_slave      = {},
    $network_name       = $kvmcluster::params::network_name,
    $ifn_network        = "",
    $sn_network         = "",
    $bcn_network        = "",
) inherits kvmcluster::params {
    # TODO: Validate parameters!

    anchor { '::kvmcluster::begin': }->
    class { '::kvmcluster::configure': }->
    class { '::kvmcluster::install': }->
    class { '::kvmcluster::service': }->
    anchor {'::kvmcluster::end': }
}
