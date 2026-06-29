{config, ...}: let
  inherit (config.theme) colors;

  workspace = id: config.programs.niri.settings.workspaces.${toString id}.name;
in {
  programs.niri.settings = {
    window-rules = [
      {
        geometry-corner-radius = let
          radius = 12.;
        in {
          bottom-left = radius;
          bottom-right = radius;
          top-left = radius;
          top-right = radius;
        };
        clip-to-geometry = true;
      }
      {
        open-maximized = true;
      }
      {
        matches = [
          {is-focused = true;}
        ];
        opacity = 0.99;
      }
      {
        matches = [
          {is-focused = false;}
        ];
        opacity = 0.95;
      }
      {
        matches = [
          {is-window-cast-target = true;}
        ];
        border = {
          active.color = "#${colors.red}";
          inactive.color = "#${colors.maroon}";
          urgent.color = "#${colors.peach}";
        };
        tab-indicator = {
          active.color = "#${colors.red}";
          inactive.color = "#${colors.maroon}";
          urgent.color = "#${colors.peach}";
        };
      }
      {
        matches = [
          {app-id = "dev.zed.*";}
          {app-id = "jetbrains-.*";}
          {app-id = "t3code";}
        ];
        open-on-workspace = workspace 1;
      }
      {
        matches = [
          {app-id = "zen";}
          {app-id = "Spotify";}
        ];
        open-on-workspace = workspace 2;
      }
      {
        matches = [
          {app-id = "equibop";}
          {app-id = "vesktop";}
          {app-id = "discord";}
          {app-id = "com.ayugram.desktop";}
          {app-id = "thunderbird";}
          {app-id = "Element";}
        ];
        open-on-workspace = workspace 4;
        block-out-from = "screen-capture";
      }
      {
        matches = [
          {app-id = "org.prismlauncher.PrismLauncher";}
          {app-id = "com.mojang.*";}
          {app-id = "Minecraft.*";}
          {app-id = "steam.*";}
          {app-id = "factorio";}
          {app-id = "mono";}
          {app-id = "Terraria.bin.*";}
        ];
        open-on-workspace = workspace 5;
      }
      {
        matches = [
          {app-id = "com.obsproject.Studio";}
        ];
        open-on-workspace = workspace 6;
      }
      {
        matches = [
          {app-id = "nwg-displays";}
        ];
        open-floating = true;
      }
      {
        matches = [
          {title = "AmneziaVPN";}
          {app-id = "org.pulseaudio.pavucontrol";}
          {app-id = ".blueman-manager-wrapped";}
          {
            app-id = "com.ayugram.desktop";
            title = "Mini App: .*";
          }
        ];
        block-out-from = "screen-capture";
        open-floating = true;
      }
      {
        matches = [
          {app-id = "jetbrains-.*";}
        ];
        open-maximized = true;
      }
      {
        matches = [
          {app-id = "Spotify";}
          {app-id = "steam.*";}
          {app-id = "org.gnome.seahorse.*";}
          {app-id = "org.kde.kdeconnect.*";}
          {title = "AFFiNE";}
        ];
        block-out-from = "screen-capture";
      }
    ];

    layer-rules = [
      {
        matches = [{namespace = "^noctalia-backdrop";}];
        place-within-backdrop = true;
      }
      {
        matches = [
          {namespace = "rofi";}
          {namespace = "noctalia-notification";}
          {namespace = "noctalia-panel";}
        ];
        block-out-from = "screen-capture";
      }
    ];
  };
}
