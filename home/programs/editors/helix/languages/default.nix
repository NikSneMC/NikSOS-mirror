{
  inputs,
  lib,
  lib',
  osConfig,
  pkgs,
  ...
}: let
  inherit (builtins) attrNames;

  notForHosts = lib'.notForHosts osConfig;

  headlessHosts = ["tobichi" "renga"];
in {
  imports = [
    ./bash.nix
    ./c.nix
    ./ci.nix
    ./docker.nix
    ./elixir.nix
    ./fish.nix
    ./go.nix
    ./helm.nix
    ./just.nix
    ./jvm.nix
    ./latex.nix
    ./lisette.nix
    ./nix.nix
    ./protobuf.nix
    ./python.nix
    ./qml.nix
    ./rust.nix
    ./sql.nix
    ./surql.nix
    ./systemd.nix
    ./tofu.nix
    ./toml.nix
    ./typst.nix
    ./web.nix
    ./yaml.nix
    ./zig.nix
  ];

  programs.helix = {
    languages = let
      globalLsps =
        {
          uwu-colors = {
            command = "uwu_colors";
          };
          wakatime-ls = {
            command = "wakatime-ls";
          };
        }
        // (notForHosts headlessHosts lib.optionalAttrs {
          discord-rpc = {
            command = "discord-rpc-lsp";
          };
        });
    in {
      language-server = globalLsps;

      global-language-servers = attrNames globalLsps;
    };

    extraPackages = with pkgs; let
      inherit (stdenv.hostPlatform) system;
    in
      [
        uwu-colors
        inputs.wakatime-ls.packages.${system}.wakatime-ls
      ]
      ++ (
        notForHosts headlessHosts lib.optional inputs.discord-rpc-lsp.packages.${system}.default
      );
  };
}
