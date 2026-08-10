{
  den.aspects.wl-clip-persist = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.wl-clip-persist];
    };
  };
}
