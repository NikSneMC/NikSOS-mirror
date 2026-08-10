{
  den.aspects.tree = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.tree];
    };
  };
}
