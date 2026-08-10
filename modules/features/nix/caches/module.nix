{
  den.aspects.caches = {
    os = {
      imports = [./options.nix];

      niksos.caches = {
        "cache.nixos.org?priority=10" = "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=";
        "nix-community.cachix.org" = "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=";
      };
    };
  };
}
