{
  den.aspects.wtype = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.wtype];
    };
  };
}
