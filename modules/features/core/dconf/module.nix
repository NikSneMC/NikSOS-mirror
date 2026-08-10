{
  den.aspects.dconf = {
    os = {
      programs.dconf.enable = true;
    };

    homeManager = {
      dconf.settings = {
        "org/gnome/desktop/wm/preferences" = {
          button-layout = ":";
        };
      };
    };
  };
}
