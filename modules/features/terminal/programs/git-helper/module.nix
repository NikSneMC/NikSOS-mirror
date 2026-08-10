{
  flake-file.inputs = {
    git-helper = {
      url = "github:NiKSneMC/git-helper";
      inputs = {
        flake-compat.follows = "flake-compat";
        flake-parts.follows = "flake-parts";
        systems.follows = "systems";
        naersk = {
          follows = "naersk";
          inputs.nixpkgs.follows = "git-helper/nixpkgs";
        };
      };
    };
  };

  den.aspects.git-helper = {
    homeManager = {inputs', ...}: {
      home.packages = [inputs'.git-helper.packages.default];
    };
  };
}
