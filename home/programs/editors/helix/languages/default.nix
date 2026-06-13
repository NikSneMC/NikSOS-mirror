{
  inputs,
  lib,
  lib',
  osConfig,
  pkgs,
  ...
}: {
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

  programs.helix = let
    inherit (builtins) listToAttrs;
    inherit (lib) optionals nameValuePair;
    inherit (pkgs.stdenv.hostPlatform) system;

    notForHosts = lib'.notForHosts osConfig;

    globalLsps = with pkgs;
      [
        uwu-colors
        inputs.wakatime-ls.packages.${system}.wakatime-ls
      ]
      ++ (notForHosts ["tobichi" "renga"] optionals [
        inputs.discord-rpc-lsp.packages.${system}.default
      ]);
  in {
    languages = rec {
      global-language-servers =
        globalLsps
        |> map (lsp: lsp.meta.mainProgram or lsp.NIX_MAIN_PROGRAM or lsp.pname);
      language-server =
        global-language-servers
        |> map (command: nameValuePair command {inherit command;})
        |> listToAttrs;
    };

    extraPackages = globalLsps;
  };
}
