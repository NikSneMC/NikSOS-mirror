{pkgs, ...}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "c";
          auto-format = true;
        }
        {
          name = "cpp";
          auto-format = true;
        }
      ];
    };

    extraPackages = with pkgs; [
      llvmPackages_21.clang-tools
    ];

    steelixGrammarOverrides = [
      {
        name = "c";
        fetcher = "github";
        owner = "tree-sitter";
        repo = "tree-sitter-c";
        rev = "7fa1be1b694b6e763686793d97da01f36a0e5c12";
        hash = "sha256-gmzbdwvrKSo6C1fqTJFGxy8x0+T+vUTswm7F5sojzKc=";
      }
    ];
  };
}
