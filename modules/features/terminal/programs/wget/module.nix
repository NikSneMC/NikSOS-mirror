{
  den.aspects.wget = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.wget];
    };
  };
}
