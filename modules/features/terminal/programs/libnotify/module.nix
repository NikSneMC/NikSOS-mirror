{
  den.aspects.libnotify = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.libnotify];
    };
  };
}
