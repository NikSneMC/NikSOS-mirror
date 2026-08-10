{
  den.aspects.unzip = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.unzip];
    };
  };
}
