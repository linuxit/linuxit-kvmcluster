class kvmcluster::configure::firewall::pre {

    Firewall {
        require => undef,
    }

    firewall { '001 INPUT allow related and established':
        ctstate => ['RELATED', 'ESTABLISHED'],
        action  => 'accept',
        proto   => 'all',
    }
    
    firewall { "002 accept all icmp requests":
        proto  => 'icmp',
        action => 'accept',
    }

    firewall { '003 INPUT allow loopback':
        iniface => 'lo',
        chain   => 'INPUT',
        action  => 'accept',
        proto   => 'all',
    }
    
    firewall { '100 allow ssh from all':
        ctstate => [ 'NEW' ],
        dport   => [ '22' ],
        proto   => 'tcp',
        action  => 'accept',
    }
}
