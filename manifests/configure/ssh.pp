class kvmcluster::configure::ssh (
    $node           =   $::kvmcluster::node_number,
    $base           =   chop($::kvmcluster::node_hostname),
    $partner_alive  =   $::kvmcluster::partner_alive,
) { 
    $num = $node ? {
        1       =>    2,
        2       =>    1,
    }
    $partner = "${base}${num}"

    if $partner_alive {
        $args = " --partner"
    }
    else {
        $args = ""
    }

    $ssh_command = '/usr/local/bin/ssh-generation.sh'
    
    file { $ssh_command:
        ensure  =>  present,
        owner   =>  "root",
        group   =>  "root",
        mode    =>  "0750",
        content =>  template("kvmcluster/ssh-generation.sh.erb")
    }->
    exec { $ssh_command:
        cwd     =>  "/tmp",
        creates =>  "/root/id_rsa",
        path    =>  [ "/bin", "sbin", "/usr/bin", "/usr/sbin", ],
    }
}
