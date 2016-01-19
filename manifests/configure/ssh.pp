class kvmcluster::configure::ssh (
    $node           =   $::kvmcluster::node_number,
    $partner_alive  =   $::kvmcluster::partner_alive,
) { 
    $partner = $node ? {
        1       =>    2,
        2       =>    1,
    }

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
        content =>  template("ssh-generation.sh.erb")
    }->
    exec { $ssh_command:
        cwd     =>  "/tmp",
        creates =>  "/root/id_rsa",
        path    =>  [ "/bin", "sbin", "/usr/bin", "/usr/sbin", ],
    }
}
