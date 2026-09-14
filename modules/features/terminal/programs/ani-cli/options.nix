{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) getExe' mkEnableOption mkIf mkOption types;

  cfg = config.programs.ani-cli;

  pkg = pkgs.ani-cli.overrideAttrs (_: {
    version = "5.1";
    src = pkgs.fetchFromGitHub {
      owner = "pystardust";
      repo = "ani-cli";
      tag = "v5.1";
      hash = "sha256-lPQA3iO3F/9NS2IziQccsJ3aai6WMQy6YObdB3mDCZA=";
    };
  });
in {
  options.programs.ani-cli = {
    enable = mkEnableOption "ani-cli";

    useNoctaliaMenu = mkOption {
      type = types.bool;
      default = false;
      description = ''
        Replace ani-cli's external menu with noctalia's. Only useful where
        the noctalia shell actually runs.
      '';
    };
  };

  config = mkIf cfg.enable {
    home.packages = [
      (
        if cfg.useNoctaliaMenu
        then
          pkgs.symlinkJoin {
            name = "ani-cli-wrapped";
            paths = [pkg];
            preferLocalBuild = true;
            nativeBuildInputs = [pkgs.makeWrapper];
            postBuild = ''
              wrapProgram $out/bin/ani-cli \
                --set ANI_CLI_MENU ${getExe' config.programs.noctalia.package "noctalia"} \
                --set ANI_CLI_MENU_FLAGS "dmenu -p"
            '';
          }
        else pkg
      )
    ];
  };
}
