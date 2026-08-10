{
  den.aspects.file = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.file];
    };
  };
}
