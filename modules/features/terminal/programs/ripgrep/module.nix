{
  den.aspects.ripgrep = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.ripgrep];
    };
  };
}
