{pkgs, ...}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "markdown";
          auto-format = true;
        }
      ];
    };

    extraPackages = with pkgs; [
      marksman
    ];

    steelixGrammarOverrides = [
      {
        name = "markdown";
        fetcher = "github";
        owner = "tree-sitter-grammars";
        repo = "tree-sitter-markdown";
        rev = "2dfd57f547f06ca5631a80f601e129d73fc8e9f0";
        hash = "sha256-IYqh6JT74deu1UU4Nyls9Eg88BvQeYEta2UXZAbuZek=";
      }
    ];
  };
}
