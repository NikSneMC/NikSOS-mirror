mkNixosModules: {inputs, ...}: {
  imports = mkNixosModules [
    inputs.nixos-wsl.nixosModules.default
    "programs/development.nix"
    "virtualisation/podman.nix"
  ];

  wsl = {
    enable = true;
    defaultUser = "niksne";
  };

  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion = "24.11";
}
