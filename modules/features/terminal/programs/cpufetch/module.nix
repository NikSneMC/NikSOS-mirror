{
  den.aspects.cpufetch = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.cpufetch];
    };
  };
}
