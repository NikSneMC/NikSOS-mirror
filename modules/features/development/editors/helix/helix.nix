{pkgs, ...}: {
  imports = [
    ./languages
    ./plugins
    ./keys.nix
    ./options.nix
  ];

  programs.helix = {
    enable = true;
    package = let
      grammarsOverlay = _: prev: {
        tree-sitter-lisette = pkgs.tree-sitter.buildGrammar {
          language = "lisette";
          version = "2f76686";
          src = pkgs.fetchFromGitHub {
            owner = "ivov";
            repo = "lisette";
            rev = "2f76686f3bd4d54ca99303a8d5e20a3f1609e354";
            hash = "sha256-x/p+hzPxLKJGEgYyuAgMr2hP2y+skztzO1GVS1NdlnA=";
          };
          location = "editors/tree-sitter-lisette";
        };
        tree-sitter-surrealql = pkgs.tree-sitter.buildGrammar {
          language = "surrealql";
          version = "8eda53c";
          src = pkgs.fetchFromGitHub {
            owner = "Ce11an";
            repo = "tree-sitter-surrealql";
            rev = "8eda53c708592d32f0c705a7f8d13d4727502e2d";
            hash = "sha256-k8TcKwLsnqBnzxQea5B64oP69SIkYaduj6HJ15hb3Tk=";
          };
        };

        tree-sitter-agda = prev.tree-sitter-agda.override {excludeBrokenTreeSitterJson = false;};
        tree-sitter-beancount = prev.tree-sitter-beancount.override {excludeBrokenTreeSitterJson = false;};
        tree-sitter-git-rebase = prev.tree-sitter-git-rebase.overrideAttrs {dontPatch = true;};
        tree-sitter-glimmer = prev.tree-sitter-glimmer.override {excludeBrokenTreeSitterJson = false;};
        tree-sitter-janet-simple = prev.tree-sitter-janet-simple.override {excludeBrokenTreeSitterJson = false;};
        tree-sitter-qmljs = prev.tree-sitter-qmljs.overrideAttrs {dontCheckForBrokenSymlinks = true;};
        tree-sitter-sql = prev.tree-sitter-sql.override {generate = false;};
        tree-sitter-strace = prev.tree-sitter-strace.override {excludeBrokenTreeSitterJson = false;};
        tree-sitter-tact = prev.tree-sitter-tact.override {excludeBrokenTreeSitterJson = false;};
        tree-sitter-tlaplus = prev.tree-sitter-tlaplus.overrideAttrs {dontPatch = true;};
        tree-sitter-vue = prev.tree-sitter-vue.override {excludeBrokenTreeSitterJson = false;};
        tree-sitter-wit = prev.tree-sitter-wit.override {excludeBrokenTreeSitterJson = false;};
        tree-sitter-yuck = prev.tree-sitter-yuck.override {excludeBrokenTreeSitterJson = false;};
      };
    in
      pkgs.callPackage ./pkgs/steelix.nix {
        helix = pkgs.helix.override {
          inherit grammarsOverlay;
          lockedGrammars = pkgs.lib.importJSON ./pkgs/steelix-grammars.json;
        };
      };

    defaultEditor = true;

    settings.editor = {
      line-number = "relative";
      completion-trigger-len = 1;
      completion-replace = true;
      bufferline = "multiple";
      color-modes = true;
      trim-trailing-whitespace = true;
      lsp = {
        display-progress-messages = true;
        display-inlay-hints = true;
      };
      cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
      indent-guides = {
        render = true;
        character = "╎";
      };
      soft-wrap.enable = true;
      inline-diagnostics = {
        cursor-line = "hint";
        other-lines = "error";
      };
    };
  };
}
