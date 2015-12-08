class kvmcluster::service { 
    service { [
        "ntpd", 
        "ricci",
        "modclusterd",
        #    "ipmi",
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
