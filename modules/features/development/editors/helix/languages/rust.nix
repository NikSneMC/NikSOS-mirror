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

    steelixGrammarOverrides = [
      {
        name = "rust";
        fetcher = "github";
        owner = "tree-sitter";
        repo = "tree-sitter-rust";
        rev = "261b20226c04ef601adbdf185a800512a5f66291";
        hash = "sha256-i6OrbcHNkrsAW5cpYOI7r0F6xn94KZWB9ZJMUH+k2ds=";
      }
    ];
  };
}
