{
  den.aspects.dust = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.dust];
    };
  };
}
