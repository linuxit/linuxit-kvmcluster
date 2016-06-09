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
# [*node_hostname*]
#   Node hostname 
# 
# [*node_network*]
#   Each nodes network configuration
#
# [*partner_alive*]
#   Is the partner node in the cluster alive - if deferring the setup, ensure false
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
    $node_hostname      = $kvmcluster::params::node_hostname,
    $node_number        = $kvmcluster::params::node_number,
    $node_network       = $kvmcluster::params::node_network,
    $partner_alive      = $kvmcluster::params::partner_alive,
    $ifn_network        = "",
    $sn_network         = "",
    $bcn_network        = "",
) inherits kvmcluster::params {
    # TODO: Validate parameters!

    anchor { '::kvmcluster::begin': }->
    class { '::kvmcluster::configure': }->
    class { '::kvmcluster::install': }->
    class { '::kvmcluster::cluster': }-> 
    class { '::kvmcluster::service': }->
    anchor {'::kvmcluster::end': }
}
