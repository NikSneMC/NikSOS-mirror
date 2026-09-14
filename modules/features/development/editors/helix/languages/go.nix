{pkgs, ...}: {
  programs.helix = {
    extraPackages = with pkgs; [
      gopls
    ];

    steelixGrammarOverrides = [
      {
        name = "go";
        fetcher = "github";
        owner = "tree-sitter";
        repo = "tree-sitter-go";
        rev = "12fe553fdaaa7449f764bc876fd777704d4fb752";
        hash = "sha256-E8ieOSkpmdsMrj1m0op0WA5ki4VkodHBMtJRCmYtmGY=";
      }
      {
        name = "gotmpl";
        fetcher = "github";
        owner = "ngalaiko";
        repo = "tree-sitter-go-template";
        rev = "ca26229bafcd3f37698a2496c2a5efa2f07e86bc";
        hash = "sha256-qPSmJ7PvteGFNSOaS3VvdJfPsQ2fmRTqHd3cIWD4ZMA=";
      }
    ];
  };
}
