{pkgs, ...}: {
  programs.helix = {
    extraPackages = with pkgs; [
      zls
    ];

    steelixGrammarOverrides = [
      {
        name = "zig";
        fetcher = "github";
        owner = "tree-sitter-grammars";
        repo = "tree-sitter-zig";
        rev = "6479aa13f32f701c383083d8b28360ebd682fb7d";
        hash = "sha256-T9Q6EhJ20tH5v1fUlnNA3UcdX52DMZE/PQjPWQtcHw0=";
      }
    ];
  };
}
