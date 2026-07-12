mkNixosModules: {pkgs, ...}: {
  imports = mkNixosModules [
    # "hardware/nvidia.nix"
    "hardware/amd.nix"
    "programs/niri.nix"
    "programs/obs-studio.nix"
    "hardware/razer.nix"
    "services/thermald.nix"
    # "services/ollama.nix"
    "virtualisation/virt-manager.nix"
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

  hardware.openrazer.users = ["niksne"];

  users.users.niksne.extraGroups = ["libvirtd"];

  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion = "23.11";
}
