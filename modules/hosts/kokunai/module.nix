{
  den,
  inputs,
  ...
}: {
  den.aspects.kokunai = {
    includes = with den.aspects; [
      vps

      server
      gateway

      hardening
    ];

    os = {
      imports = [
        inputs.disko.nixosModules.disko

        ./hardware-configuration.nix
        ./disks.nix
      ];

      boot = {
        loader = {
          grub = {
            efiSupport = true;
            efiInstallAsRemovable = true;
          };
          timeout = 1;
        };
      };

      networking = {
        useNetworkd = true;
        useDHCP = false;
      };

      systemd.network.networks."10-wan" = {
        matchConfig.MACAddress = "52:54:00:10:55:e2";

        address = [
          "95.85.240.133/32"
          "2a12:bec4:1280:203::2/64"
        ];

        routes = [
          {
            Gateway = "10.0.0.1";
            GatewayOnLink = true;
          }
          {
            Gateway = "2a12:bec4:1280:203::1";
            GatewayOnLink = true;
          }
        ];

        dns = [
          "77.88.8.8"
          "77.88.8.1"
        ];

        networkConfig.DHCP = "no";
      };

      nixpkgs.hostPlatform = "x86_64-linux";
      system.stateVersion = "26.11";
    };
  };
}
