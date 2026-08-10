{
  config,
  inputs,
  inputs',
  pkgs,
  ...
}: let
  inherit (builtins) elem;
in {
  imports = [
    ./options.nix
    ./languages
    ./keys.nix
  ];

  programs.helix = {
    enable = true;
    package = pkgs.symlinkJoin {
      name = "helix-wrapped";
      paths = [
        (inputs'.helix.packages.default.override {
          includeGrammarIf = grammar:
            config.helix.grammars == "all" || elem grammar.name config.helix.grammars;
        })
      ];
      preferLocalBuild = true;
      nativeBuildInputs = [pkgs.makeWrapper];
      postBuild = let
        runtime =
          pkgs.callPackage (import ./runtime.nix {inherit config inputs;}) {}
          |> toString;
      in
        # sh
        ''
          wrapProgram $out/bin/hx \
            --suffix HELIX_RUNTIME : ${runtime}
        '';
    };

    defaultEditor = true;
    settings.editor = {
      line-number = "relative";
      completion-trigger-len = 1;
      completion-replace = true;
      bufferline = "multiple";
      color-modes = true;
      trim-trailing-whitespace = true;
      rainbow-brackets = true;
      breadcrumb.enable = true;
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
