{
  den.aspects.thunderbird = {
    homeManager = {
      programs.thunderbird = {
        enable = true;
        profiles.main = {
          isDefault = true;
        };
      };

      catppuccin.thunderbird.profile = "main";
    };
  };
}
