mkNixosModules: {inputs, ...}: {
  imports = mkNixosModules [
    inputs.nixos-avf.nixosModules.avf
  ];

  avf = {
    defaultUser = "niksne";
  };

  nixpkgs.hostPlatform = "aarch64-linux";
  system.stateVersion = "26.05";
}
