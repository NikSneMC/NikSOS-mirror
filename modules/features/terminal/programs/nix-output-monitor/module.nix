{
  den.aspects.nix-output-monitor = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.nix-output-monitor];
    };
  };
}
