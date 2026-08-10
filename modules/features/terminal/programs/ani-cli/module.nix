{
  den.aspects.ani-cli = {
    provides = {
      noctalia-menu.homeManager.programs.ani-cli.useNoctaliaMenu = true;
    };

    homeManager = {
      imports = [./options.nix];

      programs.ani-cli.enable = true;
    };
  };
}
