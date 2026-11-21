{inputs, ...}: {
  imports = [inputs.git-hooks.flakeModule];

  flake-file.inputs = {
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-compat.follows = "flake-compat";
      };
    };
  };

  perSystem = {
    config,
    inputs',
    pkgs,
    ...
  }: {
    pre-commit.settings = {
      excludes = ["flake.lock"];

      hooks = {
        alejandra.enable = true;
        deadnix.enable = true;
      };
    };

    devShells.default = pkgs.mkShell {
      name = "niksos";
      DIRENV_LOG_FORMAT = "";

      packages = with pkgs; [
        alejandra
        deadnix
        git
        (inputs'.agenix.packages.default.override {
          nix = pkgs.lixPackageSets.stable.lix;
        })
      ];

      shellHook = ''
        ${config.pre-commit.installationScript}
      '';
    };

    formatter = pkgs.alejandra;
  };
}
