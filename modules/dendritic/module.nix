{
  inputs,
  lib,
  ...
}: let
  inherit (lib) mkDefault;
in {
  imports = [
    inputs.flake-file.flakeModules.default
    inputs.flake-file.flakeModules.import-tree
    inputs.den.flakeModule
  ];

  flake-file = {
    outputs =
      # nix
      ''
        inputs:
          inputs.flake-parts.lib.mkFlake {inherit inputs;}
          ((inputs.import-tree.match ".*/module\\.nix") ./modules)
      '';

    formatter = pkgs: pkgs.alejandra;

    inputs = {
      master.url = "github:NixOS/nixpkgs/master";
      unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
      stable.url = "github:NixOS/nixpkgs/nixos-26.05";

      nixpkgs.follows = "unstable";

      nixos-hardware = {
        url = "github:NixOS/nixos-hardware";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      assets = {
        url = "git+https://codeberg.org/NikSne/NikSOS?ref=assets";
        flake = false;
      };

      systems.url = "github:nix-systems/default";

      den.url = "github:denful/den/v0.18.0";

      import-tree.url = "github:vic/import-tree";

      flake-file.url = "github:vic/flake-file";

      flake-utils = {
        url = "github:numtide/flake-utils";
        inputs.systems.follows = "systems";
      };

      flake-compat.url = "github:NixOS/flake-compat";

      gitignore = {
        url = "github:hercules-ci/gitignore.nix";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      templates = {
        url = "github:NikSneMC/templates";
        inputs = {
          nixpkgs.follows = "nixpkgs";
          flake-compat.follows = "flake-compat";
          systems.follows = "systems";
          flake-parts.follows = "flake-parts";
          git-hooks.follows = "git-hooks";
        };
      };

      naersk = {
        url = "github:nix-community/naersk";
        inputs = {
          nixpkgs.follows = "";
          fenix.inputs.rust-analyzer-src.follows = "";
        };
      };

      rust-overlay = {
        url = "github:oxalica/rust-overlay";
        inputs.nixpkgs.follows = "";
      };

      disko = {
        url = "github:nix-community/disko";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };
  };

  systems = mkDefault ["x86_64-linux"];
}
