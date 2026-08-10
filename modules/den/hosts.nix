{
  x86_64-linux = {
    nakama = {
      users.niksne.sshKeys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINdhtDO3Z1MrC/uICq7qSW6yMPfPW5WgvavrFHXIUpcP niksne@nakama"
      ];

      role = "workstation";
      addrs = {
        lan = {
          ethernet = "192.168.1.20";
          wifi = "192.168.1.21";
        };
        vpn = "10.9.9.3";
      };
      hostKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHxsrqXzsiLa0mlMD1t0YggugeSKBh3FrU7D1+31na1H root@nakama";
    };

    konran = {
      users.niksne.sshKeys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINFbx1Sj500TEX8qbw5cFIG9nP8uLeBJGUHpDwMSosMP niksne@konran"
      ];

      role = "workstation";
      addrs = {
        lan = {
          ethernet0 = "192.168.1.10";
          ethernet1 = "192.168.1.11";
        };
        vpn = "10.9.9.2";
      };
      hostKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEILLXHAl97POqvAb0LE6ZVH39lALHVcTdk+MB3BYNde root@konran";

      builder = {
        enable = true;
        maxJobs = 36;
        speedFactor = 36;
        systems = [
          "x86_64-linux"
          "i686-linux"
          "aarch64-linux"
        ];
        supportedFeatures = [
          "benchmark"
          "nixos-test"
          "kvm"
          "recursive-nix"
          "big-parallel"
        ];
      };
    };

    kokunai = {
      users.niksne = {};

      role = "gateway";
      addrs = {
        public = {
          ipv4_1 = "95.85.240.133";
        };
      };
      hostKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBz17MOv+AdALBXaurmppAMLgGwRV/PFQuK2dKYcIQk0 root@kokunai";
    };
  };
}
