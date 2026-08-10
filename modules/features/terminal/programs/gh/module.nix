{
  den.aspects.gh = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.gh];
    };
  };
}
