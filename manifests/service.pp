class kvmcluster::service { 
    service { [
        "ntpd", 
        "ricci",
        "modclusterd",
        # TODO: Physical?   "ipmi",
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
        ensure =>   disabled,
    }
}
