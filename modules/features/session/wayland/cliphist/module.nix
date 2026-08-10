{
  den.aspects.cliphist = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.cliphist];
    };
  };
}
