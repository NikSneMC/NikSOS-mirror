{
  den.aspects.wl-screenrec = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.wl-screenrec];
    };
  };
}
