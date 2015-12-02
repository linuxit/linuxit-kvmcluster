class kvmcluster::install { 
    package { [
	    "acpid",
        "bridge-utils",
        "ccs",
        "cman",
        "compat-libstdc++-33.i686",
        "corosync",
        "cyrus-sasl",
        "cyrus-sasl-plain",
        "dmidecode",
        "drbd83-utils",
        "expect",
        "fence-agents",
        "freeipmi",
        "freeipmi-bmc-watchdog",
        "freeipmi-ipmidetectd",
        "gcc",
        "gcc-c++",
        "gd",
        "gfs2-utils",
        "gpm",
        "ipmitool",
        "kernel-headers",
        "kernel-devel",
        "kmod-drbd83",
        "libstdc++.i686",
        "libstdc++-devel.i686",
        "libvirt",
        "lvm2-cluster",
        "mailx",
        "man",
        "mlocate",
        "ntp",
        "OpenIPMI",
        "OpenIPMI-libs",
        "openssh-clients",
        "openssl-devel",
        "qemu-kvm",
        "qemu-kvm-tools",
        "parted",
        "pciutils",
        "perl",
        "perl-DBD-Pg",
        "perl-Digest-SHA",
        "perl-TermReadKey",
        "perl-Test-Simple",
        "perl-Time-HiRes",
        "perl-Net-SSH2",
        "perl-XML-Simple",
        "perl-YAML",
        "policycoreutils-python",
        "postgresql",
        "postfix",
        "python-virtinst",
        "rgmanager",
        "ricci",
        "rsync",
        "Scanner",
        "screen",
        "syslinux",
        "sysstat",
        "vim-enhanced",
        "virt-viewer",
        "wget" ]:
        ensure  =>  installed,
    }
}
