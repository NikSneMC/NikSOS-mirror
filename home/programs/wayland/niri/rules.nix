{config, ...}: let
  inherit (config.theme) colors;
in {
  programs.niri.settings = {
    window-rules = [
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
        open-on-workspace = "development";
      }
      {
        matches = [
          {app-id = "zen";}
          {app-id = "spotify";}
        ];
        open-on-workspace = "misc";
      }
      {
        matches = [
          {title = "Equibop";}
          {app-id = "vesktop";}
          {app-id = "discord";}
          {app-id = "com.ayugram";}
          {app-id = "thunderbird";}
          {app-id = "Element";}
        ];
        open-on-workspace = "social";
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
        open-on-workspace = "gaming";
      }
      {
        matches = [
          {app-id = "com.obsproject.Studio";}
        ];
        open-on-workspace = "recording/streaming";
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
          {app-id = "spotify";}
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
        matches = [
          {namespace = "rofi";}
          {namespace = "dms:notification-popup";}
          {namespace = "dms:notification-center-modal";}
          {namespace = "dms:plugins:plugin";}
          {namespace = "dms:control-center";}
          {namespace = "dms:dash";}
          {namespace = "dms:clipboard";}
        ];
        block-out-from = "screen-capture";
      }
    ];
  };
}
