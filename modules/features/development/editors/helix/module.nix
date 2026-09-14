{
  flake-file.inputs = {
    nhx.url = "github:Ra77a3l3-jar/nhx";
  };

  den.aspects.helix = {
    provides = {
      languages.homeManager.imports = [./languages/extra.nix];
    };

    homeManager = {inputs, ...}: {
      imports = [
        inputs.nhx.homeManagerModules.nhx
        ./helix.nix
      ];
    };
  };
}
