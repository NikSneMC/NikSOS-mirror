{
  den.aspects.packwiz = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.packwiz];
    };
  };
}
