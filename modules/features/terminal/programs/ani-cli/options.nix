{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf mkOption types;

  cfg = config.programs.ani-cli;
in {
  options.programs.ani-cli = {
    enable = mkEnableOption "ani-cli";

    useNoctaliaMenu = mkOption {
      type = types.bool;
      default = false;
      description = ''
        Replace ani-cli's `dmenu` external menu with noctalia's. Only useful
        where the noctalia shell actually runs.
      '';
    };
  };

  config = mkIf cfg.enable {
    home.packages = [
      (
        if cfg.useNoctaliaMenu
        then
          pkgs.ani-cli.overrideAttrs (old: {
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
        else pkgs.ani-cli
      )
    ];
  };
}
