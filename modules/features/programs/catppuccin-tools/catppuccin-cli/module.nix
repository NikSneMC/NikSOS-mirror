{
  den.aspects.catppuccin-cli = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.catppuccin];
    };
  };
}
