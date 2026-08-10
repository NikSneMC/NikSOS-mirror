{
  den.aspects.numix-icon-theme = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.numix-icon-theme-circle];
    };
  };
}
