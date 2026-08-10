{
  den.aspects.hyprpicker = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.hyprpicker];
    };
  };
}
