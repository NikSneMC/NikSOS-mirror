{
  den.aspects.simple-scan = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.simple-scan];
    };
  };
}
