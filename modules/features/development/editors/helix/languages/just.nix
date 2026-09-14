{pkgs, ...}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "just";
          auto-format = true;
        }
      ];
    };

    extraPackages = with pkgs; [
      just-lsp
    ];

    steelixGrammarOverrides = [
      {
        name = "just";
        fetcher = "github";
        owner = "poliorcetics";
        repo = "tree-sitter-just";
        rev = "b75dace757e5d122d25c1a1a7772cb87b560f829";
        hash = "sha256-ihvSD8IIddJSroGfA0w2E2E9sBYfQlwor1Ya+bSHXR8=";
      }
    ];
  };
}
