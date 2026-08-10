{
  den.aspects.mission-center = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.mission-center];
    };
  };
}
