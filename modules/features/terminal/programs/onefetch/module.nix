{
  den.aspects.onefetch = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.onefetch];
    };
  };
}
