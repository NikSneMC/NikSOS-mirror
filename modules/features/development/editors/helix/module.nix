{inputs, ...}: {
  flake-file.inputs = {
    nhx.url = "github:Ra77a3l3-jar/nhx";

    cord-hx = {
      url = "github:NikSneMC/cord.hx";
      inputs = {
        nhx.follows = "nhx";
        flake-compat.follows = "flake-compat";
        flake-parts.follows = "flake-parts";
        systems.follows = "systems";
        naersk.follows = "naersk";
      };
    };
  };

  den.aspects.helix = {
    homeManager = {pkgs, ...}: {
      imports = [
        inputs.nhx.homeManagerModules.nhx
        inputs.cord-hx.homeManagerModules.default
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
    };

    provides = {
      languages.homeManager.imports = [./languages/extra.nix];
      discord-rpc.homeManager.imports = [./plugins/cord.nix];
    };
  };
}
