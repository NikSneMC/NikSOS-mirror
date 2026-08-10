{
  den.aspects.direnv = {
    os = {
      programs.direnv = {
        enable = true;
        silent = true;
        nix-direnv.enable = true;
        settings.global.load_dotenv = true;
      };
    };
  };
}
