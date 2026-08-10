{
  den.aspects.shell-env = {
    homeManager = {config, ...}: let
      data = config.xdg.dataHome;
      conf = config.xdg.configHome;
      cache = config.xdg.cacheHome;
    in {
      home = {
        sessionVariables = {
          LESSHISTFILE = "${cache}/less/history";
          LESSKEY = "${conf}/less/lesskey";

          WINEPREFIX = "${data}/wine";
          XAUTHORITY = "$XDG_RUNTIME_DIR/Xauthority";

          DIRENV_LOG_FORMAT = "";
        };

        shell = {
          enableBashIntegration = true;
          enableFishIntegration = true;
          enableZshIntegration = true;
        };

        shellAliases = {
          btw = "fastfetch";
          jq = "jaq";
        };
      };
    };
  };
}
