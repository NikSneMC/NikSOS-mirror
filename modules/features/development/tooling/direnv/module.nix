{
  den.aspects.direnv = {
    homeManager = {
      programs.direnv = {
        enable = true;
        silent = true;
        nix-direnv.enable = true;
        config.global.load_dotenv = true;
      };
    };
  };
}
