{
  programs.helix = {
    languages = {
      language-server.rust-analyzer = {
        config = {
          cachePriming.enable = true;
          check.command = "clippy";
          interpret.tests = true;
        };
      };
    };
  };
}
