{config, ...}: let
  hex = name: "#${config.theme.colors.${name}}";
in {
  programs = {
    nhx.plugins.moka = {
      enable = true;

      config = {
        modeColors = {
          normal = {
            bg = hex "blue";
            fg = hex "base";
          };
          insert = {
            bg = hex "peach";
            fg = hex "base";
          };
          select = {
            bg = hex "green";
            fg = hex "base";
          };
        };

        sections = [
          {
            align = "left";
            segments = [
              {
                kind = "mode";
                bubble = true;
              }
              {
                kind = "git-branch";
                bg = hex "surface0";
                fg = hex "subtext1";
                bubble = true;
              }
              {
                kind = "file";
                bg = hex "surface1";
                fg = hex "text";
                bubble = true;
              }
              {
                kind = "lsp";
                bg = hex "surface0";
                fg = hex "green";
                bubble = true;
              }
              {
                kind = "diagnostics";
                bg = hex "surface0";
                fg = hex "peach";
                bubble = true;
              }
            ];
          }
          {
            align = "right";
            segments = [
              {
                kind = "selections";
                bg = hex "lavender";
                fg = hex "base";
                bubble = true;
              }
              {
                kind = "primary-selection-length";
                bg = hex "sky";
                fg = hex "base";
                bubble = true;
              }
              {
                kind = "position";
                bg = hex "accent";
                fg = hex "base";
                bubble = true;
              }
              {
                kind = "position-percentage";
                bg = hex "teal";
                fg = hex "base";
                bubble = true;
              }
            ];
          }
        ];

        bufferline = {
          active = {
            bg = hex "blue";
            fg = hex "base";
            bubble = true;
          };
          inactive = {
            bg = hex "surface0";
            fg = hex "subtext0";
            bubble = true;
          };
          gap = 0;
        };
      };
    };

    helix.settings.keys.normal.space.t = {
      h = ":moka-bufferline-move-left!";
      l = ":moka-bufferline-move-right!";
    };
  };
}
