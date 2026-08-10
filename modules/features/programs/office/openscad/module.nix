{
  den.aspects.openscad = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.openscad];
    };
  };
}
