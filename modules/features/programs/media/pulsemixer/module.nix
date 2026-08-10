{
  den.aspects.pulsemixer = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.pulsemixer];
    };
  };
}
