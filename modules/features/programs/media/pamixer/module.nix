{
  den.aspects.pamixer = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.pamixer];
    };
  };
}
