{
  den.aspects.wl-mirror = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.wl-mirror];
    };
  };
}
