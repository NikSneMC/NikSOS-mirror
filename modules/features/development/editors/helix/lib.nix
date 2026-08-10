{lib, ...}: let
  inherit (builtins) listToAttrs;
  inherit (lib) nameValuePair;

  mkGlobalLsps = lsps: let
    names =
      lsps
      |> map (
        lsp:
          lsp.meta.mainProgram
          or lsp.NIX_MAIN_PROGRAM
          or lsp.pname
      );
  in {
    languages = {
      global-language-servers = names;
      language-server =
        names
        |> map (command: nameValuePair command {inherit command;})
        |> listToAttrs;
    };

    extraPackages = lsps;
  };
in {
  inherit mkGlobalLsps;
}
