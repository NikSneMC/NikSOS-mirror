{den, ...}: {
  den.aspects.nix = {
    includes = with den.aspects; [
      caches
      comma
      nix-ld
      documentation
      nh
      nix-settings
      nixpkgs-config
    ];
  };
}
