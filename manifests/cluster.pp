class kvmcluster::cluster (

) {
    $configuration = "/etc/cluster/cluster.conf"

    file { $configuration:
        ensure      =>  present,
        owner       =>  "root",
        group       =>  "root",
        mode        =>  "0644",
        content     =>  template("kvmcluster/cluster.conf.erb")
    }
}
