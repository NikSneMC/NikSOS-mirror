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
    package = pkgs.steelix;

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
