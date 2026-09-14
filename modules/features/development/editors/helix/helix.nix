{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./languages
    ./plugins
    ./keys.nix
    ./options.nix
  ];

  programs.helix = {
    enable = true;
    package = let
      defaultGrammarsOverlay = _: prev: {
        tree-sitter-agda = prev.tree-sitter-agda.override {excludeBrokenTreeSitterJson = false;};
        tree-sitter-beancount = prev.tree-sitter-beancount.override {excludeBrokenTreeSitterJson = false;};
        tree-sitter-git-rebase = prev.tree-sitter-git-rebase.overrideAttrs {dontPatch = true;};
        tree-sitter-glimmer = prev.tree-sitter-glimmer.override {excludeBrokenTreeSitterJson = false;};
        tree-sitter-janet-simple = prev.tree-sitter-janet-simple.override {excludeBrokenTreeSitterJson = false;};
        tree-sitter-qmljs = prev.tree-sitter-qmljs.overrideAttrs {dontCheckForBrokenSymlinks = true;};
        tree-sitter-sql = prev.tree-sitter-sql.override {generate = false;};
        tree-sitter-strace = prev.tree-sitter-strace.override {excludeBrokenTreeSitterJson = false;};
        tree-sitter-tact = prev.tree-sitter-tact.override {excludeBrokenTreeSitterJson = false;};
        tree-sitter-vue = prev.tree-sitter-vue.override {excludeBrokenTreeSitterJson = false;};
        tree-sitter-wit = prev.tree-sitter-wit.override {excludeBrokenTreeSitterJson = false;};
        tree-sitter-yuck = prev.tree-sitter-yuck.override {excludeBrokenTreeSitterJson = false;};
      };

      steelixGrammarRevs = config.programs.helix.steelixGrammarOverrides;

      fetchGrammarSrc = g:
        {
          github = pkgs.fetchFromGitHub {inherit (g) owner repo rev hash;};
          gitlab = pkgs.fetchFromGitLab {inherit (g) owner repo rev hash;};
          codeberg = pkgs.fetchFromCodeberg {inherit (g) owner repo rev hash;};
        }
        .${
          g.fetcher
        };

      steelixGrammarsOverlay = _: prev:
        builtins.listToAttrs (map (g: {
            name = "tree-sitter-${g.name}";
            value = prev."tree-sitter-${g.name}".overrideAttrs (_: {
              version = builtins.substring 0 7 g.rev;
              src = fetchGrammarSrc g;
            });
          })
          steelixGrammarRevs);
    in
      pkgs.steelix.override {
        helix = pkgs.helix.override {
          grammarsOverlay = pkgs.lib.composeExtensions defaultGrammarsOverlay steelixGrammarsOverlay;
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

  xdg.configFile = let
    extraRuntime = pkgs.callPackage (import ./runtime.nix {inherit config;}) {};
  in {
    "helix/runtime/grammars".source = "${extraRuntime}/grammars";
    "helix/runtime/queries".source = "${extraRuntime}/queries";
  };
}
