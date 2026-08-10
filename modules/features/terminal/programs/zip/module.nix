{
  den.aspects.zip = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.zip];
    };
  };
}
