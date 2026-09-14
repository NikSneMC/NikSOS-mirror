{
  den.aspects.hardened-kernel = {
    os = {
      config,
      lib,
      ...
    }: let
      inherit (lib) mkDefault;

      enableNamespaces = config.virtualisation.containers.enable || config.nix.settings.sandbox;
    in {
      boot = {
        kernel.sysctl = {
          "fs.suid_dumpable" = 0;
          "kernel.kptr_restrict" = 2;
          "kernel.dmesg_restrict" = 1;
          "kernel.unprivileged_bpf_disabled" = 1;
          "dev.tty.ldisc_autoload" = 0;
          "vm.unprivileged_userfaultfd" = 0;
          "kernel.kexec_load_disabled" = 1;
          "kernel.sysrq" = 4;
          "kernel.perf_event_paranoid" = 3;

          "net.ipv4.tcp_syncookies" = 1;
          "net.ipv4.tcp_rfc1337" = 1;
          "net.ipv4.conf.default.rp_filter" = mkDefault 1;
          "net.ipv4.conf.all.rp_filter" = mkDefault 1;

          "net.ipv4.conf.all.accept_redirects" = 0;
          "net.ipv4.conf.default.accept_redirects" = 0;
          "net.ipv4.conf.all.secure_redirects" = 0;
          "net.ipv4.conf.default.secure_redirects" = 0;
          "net.ipv6.conf.all.accept_redirects" = 0;
          "net.ipv6.conf.default.accept_redirects" = 0;
          "net.ipv4.conf.all.send_redirects" = 0;
          "net.ipv4.conf.default.send_redirects" = 0;

          "net.ipv4.conf.all.forwarding" = mkDefault 0;
          "net.ipv4.conf.default.accept_source_route" = 0;
          "net.ipv4.conf.all.accept_source_route" = 0;
          "net.ipv6.conf.all.accept_source_route" = 0;
          "net.ipv6.conf.default.accept_source_route" = 0;
          "net.ipv6.conf.all.forwarding" = mkDefault 0;

          "net.ipv4.icmp_ignore_bogus_error_responses" = 1;

          "kernel.yama.ptrace_scope" = 2;

          "fs.protected_symlinks" = 1;
          "fs.protected_hardlinks" = 1;
          "fs.protected_fifos" = 2;
          "fs.protected_regular" = 2;

          "kernel.randomize_va_space" = 2;

          "net.ipv4.tcp_fastopen" = 3;

          "user.max_user_namespaces" = mkDefault (
            if enableNamespaces
            then 65536
            else 0
          );
        };

        kernelParams = [
          "slab_nomerge"
          "init_on_alloc=1"
          "init_on_free=1"
          "page_alloc.shuffle=1"
          "randomize_kstack_offset=on"
          "vsyscall=none"
          "debugfs=off"
          "module.sig_enforce=1"
          "lockdown=confidentiality"
        ];

        blacklistedKernelModules = [
          "dccp"
          "sctp"
          "rds"
          "tipc"
          "n-hdlc"
          "ax25"
          "netrom"
          "x25"
          "rose"
          "decnet"
          "econet"
          "af_802154"
          "ipx"
          "appletalk"
          "psnap"
          "p8023"
          "p8022"
          "can"
          "atm"
          "cramfs"
          "freevxfs"
          "jffs2"
          "hfs"
          "hfsplus"
          "udf"

          "cifs"
          "nfs"
          "nfsv3"
          "nfsv4"
          "ksmbd"
          "gfs2"
          "vivid"
        ];
      };

      security = {
        protectKernelImage = true;
        lockKernelModules = false;

        forcePageTableIsolation = true;

        allowUserNamespaces = mkDefault enableNamespaces;

        allowSimultaneousMultithreading = true;
      };
    };
  };
}
