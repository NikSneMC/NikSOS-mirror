{
  den.aspects.nix-prefetch-github = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.nix-prefetch-github];
    };
  };
}
