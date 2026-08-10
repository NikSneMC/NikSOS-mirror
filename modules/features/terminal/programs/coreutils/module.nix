{
  den.aspects.coreutils = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.uutils-coreutils-noprefix];
    };
  };
}
