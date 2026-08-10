{
  inputs,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkDefault;
in {
  imports = [
    ./bash.nix
    ./fish.nix
    ./nix.nix
    ./systemd.nix
    ./toml.nix
    ./yaml.nix
  ];

  helix.grammars = mkDefault [
    "bash"
    "comment"
    "diff"
    "fish"
    "git-config"
    "git-rebase"
    "gitattributes"
    "gitcommit"
    "gitignore"
    "ini"
    "json"
    "nix"
    "regex"
    "toml"
    "yaml"
  ];

  programs.helix = let
    inherit (pkgs.stdenv.hostPlatform) system;
    inherit (import ../lib.nix {inherit lib;}) mkGlobalLsps;
  in
    mkGlobalLsps (with pkgs; [
      uwu-colors
      inputs.wakatime-ls.packages.${system}.wakatime-ls
    ]);
}
