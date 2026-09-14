{pkgs, ...}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "python";
          auto-format = true;
          language-servers = [
            "basedpyright"
            "ruff"
          ];
        }
      ];
    };

    extraPackages = with pkgs; [
      basedpyright
      ruff
    ];

    steelixGrammarOverrides = [
      {
        name = "python";
        fetcher = "github";
        owner = "tree-sitter";
        repo = "tree-sitter-python";
        rev = "293fdc02038ee2bf0e2e206711b69c90ac0d413f";
        hash = "sha256-F5XH21PjPpbwYylgKdwD3MZ5o0amDt4xf/e5UikPcxY=";
      }
    ];
  };
}
