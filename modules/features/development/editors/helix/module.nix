{
  flake-file.inputs = {
    nhx.url = "github:Ra77a3l3-jar/nhx";

    # wakatime-ls = {
    #   url = "github:mrnossiom/wakatime-ls";
    #   inputs = {
    #     gitignore.follows = "gitignore";
    #     rust-overlay = {
    #       follows = "rust-overlay";
    #       inputs.nixpkgs.follows = "wakatime-ls/nixpkgs";
    #     };
    #   };
    # };

    # discord-rpc-lsp = {
    #   url = "gitlab:invra/discord-rpc-lsp";
    #   inputs.flake-utils.follows = "flake-utils";
    # };
  };

  den.aspects.helix = {
    provides = {
      languages.homeManager.imports = [./languages/extra.nix];

      # discord-rpc.homeManager = {
      #   inputs',
      #   lib,
      #   ...
      # }: {
      #   programs.helix = let
      #     inherit (import ./lib.nix {inherit lib;}) mkGlobalLsps;
      #   in
      #     mkGlobalLsps [
      #       inputs'.discord-rpc-lsp.packages.default
      #     ];
      # };
    };

    homeManager = {inputs, ...}: {
      imports = [
        inputs.nhx.homeManagerModules.nhx
        ./helix.nix
      ];
    };
  };
}
