{
  den.aspects.whiskers = {
    homeManager = {
      inputs,
      pkgs,
      ...
    }: {
      home.packages = [inputs.catppuccin.packages.${pkgs.stdenv.hostPlatform.system}.whiskers];
    };
  };
}
