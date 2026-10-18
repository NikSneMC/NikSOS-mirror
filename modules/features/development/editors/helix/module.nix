{inputs, ...}: {
  flake-file.inputs = {
    nhx.url = "github:Ra77a3l3-jar/nhx";

    cord-hx = {
      url = "github:NikSneMC/cord.hx";
      inputs = {
        nhx.follows = "nhx";
        flake-compat.follows = "flake-compat";
        flake-parts.follows = "flake-parts";
        systems.follows = "systems";
        naersk.follows = "naersk";
      };
    };
  };

  den.aspects.helix = {
    provides = {
      languages.homeManager.imports = [./languages/extra.nix];
      discord-rpc.homeManager.imports = [./plugins/cord.nix];
    };

    homeManager = {
      imports = [
        inputs.nhx.homeManagerModules.nhx
        inputs.cord-hx.homeManagerModules.default
        ./helix.nix
      ];
    };
  };
}
