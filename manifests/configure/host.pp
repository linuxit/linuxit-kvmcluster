class kvmcluster::configure::host (
    $node       =   $::kvmcluster::node_number,
    $nodes      =   $::kvmcluster::node_network,
    $base       =   $::kvmcluster::node_hostname,
) { 
    $other = $node ? {
        1       =>    2,
        2       =>    1,
    }

    class { "hosts": 
        host_entries => {
            # This node
            "$base$node"  => {
                ip           => $nodes[$node]["bcn"],
                host_aliases => [
                    "$base$node.bcn",
                    "$base$node${::domain}",
                ],
            },
            "$base$node.ipmi"  => {
                ip          => $nodes[$node]["ipmi"],
            },
            "$base$node.sn" => { 
                ip          => $nodes[$node]["sn"],
            },
            "$base$node.ifn" => {
                ip           => $nodes[$node]["ifn"],
            },

            # Other node
            "$base$other"  => {
                ip           => $nodes[$other]["bcn"],
                host_aliases => [
                    "$base$other.bcn",
                    "$base$other${::domain}",
                ],
            },
            "$base$other.ipmi"  => {
                ip          => $nodes[$other]["ipmi"],
            },
            "$base$other.sn" => { 
                ip          => $nodes[$other]["sn"],
            },
            "$base$other.ifn" => {
                ip           => $nodes[$other]["ifn"],
            },
        }
        # TODO: Still to do: UPS and PDU
    }
}
