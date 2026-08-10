{
  den.aspects.catwalk = {
    homeManager = {
      inputs,
      pkgs,
      ...
    }: {
      home.packages = [inputs.catppuccin.packages.${pkgs.stdenv.hostPlatform.system}.catwalk];
    };
  };
}
