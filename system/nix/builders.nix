{lib, ...}: let
  inherit (builtins) mapAttrs attrValues concatLists listToAttrs;
  inherit (lib) nameValuePair;
in {
  nix = {
    distributedBuilds = true;

    buildMachines = [
      {
        hostName = "konran";
        systems = ["x86_64-linux" "i686-linux" "aarch64-linux"];
        maxJobs = 36;
        speedFactor = 36;
        supportedFeatures = ["benchmark" "nixos-test" "kvm" "recursive-nix" "big-parallel"];
        protocol = "ssh-ng";
        sshUser = "builder";
        sshKey = "/etc/ssh/ssh_host_ed25519_key";
        publicHostKey = "c3NoLWVkMjU1MTkgQUFBQUMzTnphQzFsWkRJMU5URTVBQUFBSUVJTExYSEFsOTdQT3F2QWIwTEU2WlZIMzlsQUxIVmNUZGsrTUIzQllOZGUgcm9vdEBrb25yYW4K";
      }
    ];

    settings.max-jobs = 0;
  };

  networking.hosts =
    {
      konran = ["192.168.1.10" "192.168.1.11" "10.8.1.9"];
    }
    |> mapAttrs (hostname: map (ip: nameValuePair ip [hostname]))
    |> attrValues
    |> concatLists
    |> listToAttrs;
}
