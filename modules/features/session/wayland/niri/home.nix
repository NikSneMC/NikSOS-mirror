{config, ...}: {
  imports = [
    ./binds.nix
    ./input.nix
    ./layout.nix
    ./rules.nix
  ];

  programs.niri.settings = {
    includes = [
      {
        path = "monitor.kdl";
        optional = true;
      }
    ];

    environment = {
      _JAVA_AWT_WM_NONREPARENTING = "1";
    };

    workspaces = {
      "1".name = " development";
      "2".name = " misc";
      "3".name = "󱛉 education";
      "4".name = "󰭹 social";
      "5".name = "󰊗 gaming";
      "6".name = "󰻃 recording/streaming";
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

    recent-windows = {
      enable = true;
      highlight = {
        active-color = "#${config.theme.colors.accent}ff";
        urgent-color = "#${config.theme.colors.yellow}ff";
        padding = 30;
        corner-radius = 12;
      };
    };

    gestures.hot-corners.enable = false;

    xwayland-satellite.enable = true;

    # Allows notification actions and window activation from Noctalia.
    debug.honor-xdg-activation-with-invalid-serial = [];
  };
}
