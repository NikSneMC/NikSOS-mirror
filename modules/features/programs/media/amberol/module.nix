{
  den.aspects.amberol = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.amberol];
    };
  };
}
