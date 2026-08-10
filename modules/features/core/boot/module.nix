{inputs, ...}: let
  niksos-logo = "${inputs.assets}/niksos/niksos100.png";
in {
  flake-file.inputs = {
    nix-cachyos-kernel = {
      url = "github:xddxdd/nix-cachyos-kernel/release";
      inputs = {
        flake-compat.follows = "flake-compat";
        flake-parts.follows = "flake-parts";
      };
    };
  };

  den.aspects.boot = {
    os = {
      lib,
      pkgs,
      ...
    }: let
      inherit (lib) mkDefault mkForce;
    in {
      nixpkgs.overlays = [inputs.nix-cachyos-kernel.overlays.pinned];

      niksos.caches."attic.xuyh0120.win/lantian" = "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc=";

      boot = {
        initrd = {
          systemd.enable = true;
          supportedFilesystems = ["fat32" "ext4" "btrfs" "ntfs"];
        };

        binfmt.emulatedSystems = ["aarch64-linux"];

        kernelPackages = mkDefault pkgs.cachyosKernels.linuxPackages-cachyos-latest-lto;
        consoleLogLevel = 3;
        kernelParams = [
          # "quiet"
          "systemd.show_status=auto"
          "rd.udev.log_level=3"
        ];

        loader = {
          grub = {
            enable = true;
            useOSProber = true;
            extraFiles."theme/logo.png" = mkForce niksos-logo;
            configurationLimit = 25;
          };
          timeout = 3;
        };

        plymouth = {
          enable = true;
          logo = niksos-logo;
        };
      };
    };
  };
}
