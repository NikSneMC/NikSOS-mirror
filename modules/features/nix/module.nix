{den, ...}: {
  den.aspects.nix = {
    includes = with den.aspects; [
      caches
      comma
      nix-ld
      documentation
      nh
      nix-overlays
      nix-settings
      nixpkgs-config
    ];
  };
}
