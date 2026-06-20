{
  programs.helix = {
    languages = {
      language-server.rust-analyzer = {
        config = {
          cachePriming.enable = true;
          interpret.tests = true;
        };
      };
    };
  };
}
