{
  den.aspects.duf = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.duf];
    };
  };
}
