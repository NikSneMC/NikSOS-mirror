{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkForce getExe';
in {
  programs.rio = {
    enable = true;
    package = inputs.rio.packages.${pkgs.stdenv.hostPlatform.system}.default;
    settings = {
      colors = with config.theme.colors; {
        tabs = mkForce "#${text}";
        tabs-active = mkForce "#${accent}";
        tabs-active-highlight = mkForce "#${accent}";
      };
      confirm-before-quit = false;
      fonts = {
        family = "JetBrainsMono Nerd Font Mono";
        size = 15;
        extras = [{family = "Noto Sans Mono CJK JP";}];
        emoji = [{family = "Noto Color Emoji";}];
        symbol-map = [
          {
            start = "4E00";
            end = "9FFF";
            font-family = "Noto Sans Mono CJK JP";
          }
        ];
      };
      copy-on-select = true;
      editor.program = getExe' config.programs.helix.package "hx";
      navigation = {
        mode = "Tab";
        use-split = false;
        hide-if-single = false;
      };
      padding = [0];
      panel.padding = [0];
      renderer.performance = "high";
      scroll = {
        multiplier = 10.0;
        divider = 0.5;
      };
      window = {
        opacity = 0.85;
        blur = true;
        decorations = "Transparent";
      };
      bindings.keys = [
        {
          key = "h";
          "with" = "control";
          action = "SelectPrevTab";
        }
        {
          key = "l";
          "with" = "control";
          action = "SelectNextTab";
        }
        {
          key = "h";
          "with" = "control | shift";
          action = "MoveCurrentTabToPrev";
        }
        {
          key = "l";
          "with" = "control | shift";
          action = "MoveCurrentTabToNext";
        }
      ];
    };
  };
}
