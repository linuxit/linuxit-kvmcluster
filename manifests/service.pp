class kvmcluster::service { 
    service { [
        "network",
        "ntpd", 
        "ricci",
        "modclusterd",
        "ipmi",
        "iptables",
    ]: 
        ensure =>   running,
    }

    service { [
        "acpid",
        "ip6tables",
        "clvmd",
        "gfs2",
        "libvirtd",
        "cman",
        "rgmanager",
    ]: 
        ensure =>   stopped,
    }
}
