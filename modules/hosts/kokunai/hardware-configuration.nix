{
  lib,
  modulesPath,
  ...
}: let
  inherit (lib) mkDefault;
in {
  imports = [
    "${modulesPath}/profiles/qemu-guest.nix"
  ];

  boot = {
    initrd = {
      availableKernelModules = ["ata_piix" "uhci_hcd" "virtio_pci" "sr_mod" "virtio_blk"];
      kernelModules = [];
    };
    kernelModules = ["kvm-amd"];
    extraModulePackages = [];
  };

  networking.useDHCP = mkDefault true;

  nixpkgs.hostPlatform = mkDefault "x86_64-linux";
}
