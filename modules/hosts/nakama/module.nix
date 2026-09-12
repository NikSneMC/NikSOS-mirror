{
  den,
  inputs,
  ...
}: {
  den.aspects.nakama = {
    includes = with den.aspects; [
      workstation
      laptop
      nvidia
      nvidia-prime
      razer
      # builders
      niri
      nginx
      obs-studio
      thermald
      virt-manager
      zellij-web
      filebrowser
    ];

    os = {pkgs, ...}: {
      imports = [
        inputs.disko.nixosModules.disko

        ./hardware-configuration.nix
        ./disks/disks.nix
      ];

      boot = {
        kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest-lto-x86_64-v3;

        loader = {
          grub = {
            efiSupport = true;
            device = "nodev";
          };
          efi.canTouchEfiVariables = true;
        };
      };

      zramSwap.enable = true;

      theme = {
        flavor = "mocha";
        accent = "blue";
      };

      services = {
        displayManager.defaultSession = "niri";
        fstrim.enable = true;
      };

      hardware.nvidia.prime = {
        nvidiaBusId = "PCI:1:0:0";
        intelBusId = "PCI:0:2:0";
      };

      nixpkgs.hostPlatform = "x86_64-linux";
      system.stateVersion = "24.05";
    };
  };
}
