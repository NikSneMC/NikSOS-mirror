{
  den,
  inputs,
  ...
}: {
  den.aspects.konran = {
    includes = with den.aspects; [
      workstation
      amd
      razer
      builder
      niri
      obs-studio
      thermald
      virt-manager
    ];

    os = {pkgs, ...}: {
      imports = [
        inputs.disko.nixosModules.disko

        ./hardware-configuration.nix
        ./disks/root.nix
        ./disks/data.nix
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

      nixpkgs.hostPlatform = "x86_64-linux";
      system.stateVersion = "23.11";
    };
  };
}
