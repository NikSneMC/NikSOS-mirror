{
  flake-file.inputs = {
    helix = {
      url = "github:NikSneMC/helix";
      inputs.rust-overlay = {
        follows = "rust-overlay";
        inputs.nixpkgs.follows = "helix/nixpkgs";
      };
    };

    wakatime-ls = {
      url = "github:mrnossiom/wakatime-ls";
      inputs = {
        gitignore.follows = "gitignore";
        rust-overlay = {
          follows = "rust-overlay";
          inputs.nixpkgs.follows = "wakatime-ls/nixpkgs";
        };
      };
    };

    discord-rpc-lsp = {
      url = "gitlab:invra/discord-rpc-lsp";
      inputs.flake-utils.follows = "flake-utils";
    };
  };

  den.aspects.helix = {
    provides = {
      languages.homeManager.imports = [./languages/extra.nix];

      discord-rpc.homeManager = {
        inputs',
        lib,
        ...
      }: {
        programs.helix = let
          inherit (import ./lib.nix {inherit lib;}) mkGlobalLsps;
        in
          mkGlobalLsps [
            inputs'.discord-rpc-lsp.packages.default
          ];
      };
    };

    os = {
      niksos.caches."helix.cachix.org" = "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs=";
    };

    homeManager = {
      imports = [
        ./helix.nix
        ./keys.nix
        ./languages
      ];
    };
  };
}
