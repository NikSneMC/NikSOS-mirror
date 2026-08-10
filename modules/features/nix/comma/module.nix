{inputs, ...}: {
  flake-file.inputs = {
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.comma = {
    os = {
      imports = [inputs.nix-index-database.nixosModules.default];

      programs.nix-index-database.comma.enable = true;
    };

    homeManager = {
      imports = [inputs.nix-index-database.homeModules.default];

      programs.nix-index-database.comma.enable = true;
    };
  };
}
