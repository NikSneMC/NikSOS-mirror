{
  config,
  lib,
  lib',
  osConfig,
  pkgs,
  ...
}: let
  inherit (lib) optionalAttrs;

  notForHosts = lib'.notForHosts osConfig;
in {
  home.packages = [
    (
      pkgs.ani-cli.overrideAttrs (old:
        notForHosts ["tobichi" "renga"] optionalAttrs {
          postPatch =
            (old.postPatch or "")
            + ''
              substituteInPlace ani-cli \
                --replace-fail \
                  '[ "$use_external_menu" = "2" ] && dmenu -l 20 -p "$2"' \
                  '[ "$use_external_menu" = "2" ] && noctalia dmenu -p "$2"'
            '';

          buildInputs = (old.buildInputs or []) ++ [config.programs.noctalia.package];
        })
    )
  ];
}
