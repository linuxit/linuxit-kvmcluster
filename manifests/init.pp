# == Class: kvmcluster
#
# Full description of class kvmcluster here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class kvmcluster (
    $name_prefix        = $kvmcluster::params::name_prefix,
    $node_number        = $kvmcluster::params::node_number,
    $network_bonds      = {},
    $network_slaves     = {},
    $network_names      = $kvmcluster::params::network_names,
) {

    anchor { '::begin': }->
    class { '::kvmcluster::configure': }->
    class { '::kvmcluster::install': }->
    class { '::kvmcluster::service': }->
    anchor { '::end': }
}
