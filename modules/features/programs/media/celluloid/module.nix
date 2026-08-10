{
  den.aspects.celluloid = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.celluloid];
    };
  };
}
