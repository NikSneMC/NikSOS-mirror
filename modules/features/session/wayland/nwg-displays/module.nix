{
  den.aspects.nwg-displays = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.nwg-displays];
    };
  };
}
