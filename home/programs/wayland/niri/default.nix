{
  config,
  lib,
  ...
}: {
  imports = [
    ./binds.nix
    ./input.nix
    ./layout.nix
    ./rules.nix
  ];

  programs.niri.settings = {
    environment = {
      _JAVA_AWT_WM_NONREPARENTING = "1";
    };

    workspaces = {
      "1".name = "development";
      "2".name = "misc";
      "3".name = "education";
      "4".name = "social";
      "5".name = "gaming";
      "6".name = "recording/streaming";
    };

    animations.slowdown = 0.5;

    screenshot-path = "~/Pictures/Screenshots/screenshot-%d-%m-%Y_%H_%M_%S.png";
    prefer-no-csd = true;

    hotkey-overlay = {
      hide-not-bound = true;
      skip-at-startup = true;
    };

    overview = {
      backdrop-color = config.theme.colors.base;
      workspace-shadow.enable = false;
    };

    gestures.hot-corners.enable = false;

    xwayland-satellite.enable = true;
  };

  xdg.configFile = {
    niri-config.target = lib.mkForce "niri/hm.kdl";
    "niri/config.kdl".text =
      # kdl
      ''
        include "hm.kdl"
        include optional=true "monitor.kdl"

        layout { border { on; }; }

        // FIXME: rio's blur and transparency seems broken
        window-rule {
          match app-id="rio"

          opacity 0.9
          background-effect {
            blur true
          }
        }

        recent-windows {
          highlight {
            active-color "#${config.theme.colors.accent}ff"
            urgent-color "#${config.theme.colors.yellow}ff"
            padding 30
            corner-radius 12
          }

          binds {
            Mod+Tab       hotkey-overlay-title="Switch to the next recent window" {
              next-window;
            }
            Mod+Shift+Tab hotkey-overlay-title="Switch to the previous recent window" {
              previous-window;
            }
          }
        }

      '';
  };
}
