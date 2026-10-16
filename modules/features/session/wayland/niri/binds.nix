{
  config,
  lib,
  ...
}: let
  inherit (lib) mergeAttrsList;

  inherit (import ./lib.nix {inherit lib;}) mkBinds mkWorkspacesBinds mkColumnsBinds;
in {
  programs.niri.settings = with config.lib.niri.actions; let
    recent-windows = config.lib.niri.actions.recent-windows |> mergeAttrsList;
  in {
    binds = let
      fish = spawn "fish" "-c";
      noctalia = spawn "noctalia" "msg";
      noctalia-panel = noctalia "panel-toggle";
      noctalia-launcher = noctalia-panel "launcher";
      noctalia-control = noctalia-panel "control-center";
    in
      mkBinds true (
        (mkWorkspacesBinds config)
        // (mkColumnsBinds 10)
        // {
          "Mod+Ctrl+K" = {
            desc = "Enter the `kill mode`";
            action = fish "pkill -9 -P $(niri msg -j pick-window | jaq .pid)";
          };
          "Mod+Ctrl+Alt+Shift+E" = {
            desc = "Exit niri";
            action = quit;
          };
          "Mod+Shift+Q" = {
            desc = "Close the focused window";
            action = close-window;
          };

          "Mod+M" = {
            desc = "Toggle the maximized state of the focused column";
            action = maximize-column;
          };
          "Mod+U" = {
            desc = "Switch between preset column widths backwards";
            action = switch-preset-column-width-back;
          };
          "Mod+P" = {
            desc = "Switch between preset column widths";
            action = switch-preset-column-width;
          };

          "F11" = {
            desc = "Toggle fullscreen on the focused window";
            action = fullscreen-window;
          };
          "Mod+F" = {
            desc = "Move the focused window between the floating and the tiling layout";
            action = toggle-window-floating;
          };
          "Mod+Ctrl+F" = {
            desc = "Toggles the focus between the floating and the tiling layout";
            action = switch-focus-between-floating-and-tiling;
          };
          "Mod+Alt+F" = {
            desc = "Toggles the windowed fullscreen status for the focused window";
            action = toggle-windowed-fullscreen;
          };

          "Mod+Alt+C" = {
            desc = "Clear dynamic cast target";
            action = clear-dynamic-cast-target;
          };
          "Mod+Alt+W" = {
            desc = "Select a window for dynamic cast target";
            action = set-dynamic-cast-window;
          };
          "Mod+Alt+M" = {
            desc = "Select an output for dynamic cast target";
            action = set-dynamic-cast-monitor;
          };

          "Mod+Ctrl+Alt+S" = {
            desc = "Reload noctalia";
            action = noctalia "config-reload";
          };

          "Mod+A" = {
            desc = "Launch app menu";
            action = noctalia-launcher;
          };
          "Mod+B" = {
            desc = "Launch primary browser";
            action = spawn "zen-beta";
          };
          "Mod+D" = {
            desc = "Launch Discord";
            action = spawn "equibop";
          };
          "Mod+E" = {
            desc = "Launch file manager";
            action = spawn "thunar";
          };
          "Mod+I" = {
            desc = "Open noctalia settings";
            action = noctalia "settings-toggle";
          };
          "Mod+N" = {
            desc = "Open notification center";
            action = noctalia-control "notifications";
          };
          "Mod+R" = {
            desc = "Execute command";
            action = noctalia-launcher "/run ";
          };
          "Mod+T" = {
            desc = "Launch terminal";
            action = spawn "rio";
          };
          "Mod+V" = {
            desc = "Open clipboard history";
            action = noctalia-panel "clipboard";
          };
          # "Mod+X" = # {
          #   desc = "Delete an item from the clipboard history";
          #   action = fish "noctalia clipboard search --json -l 1 | jq '.entries[0].id' | xargs noctalia clipboard delete";
          # };
          "Mod+Escape" = {
            desc = "Open logout menu";
            action = noctalia-panel "session";
          };
          "Mod+Semicolon" = {
            desc = "Open emoju menu";
            action = noctalia-launcher "/emo ";
          };
          "Mod+Alt+Tab" = {
            desc = "Toggle overview";
            action = toggle-overview;
          };

          "Mod+Shift+A" = {
            desc = "Open 2fa menu";
            action = noctalia-launcher "/2fa ";
          };
          "Mod+Shift+B" = {
            desc = "Launch secondary browser";
            action = spawn "helium";
          };
          "Mod+Shift+C" = {
            desc = "Launch color picker";
            action = spawn "hyprpicker" "--autocopy" "--notify" "--lowercase-hex";
          };
          "Mod+Shift+G" = {
            desc = "Lock session";
            action = noctalia "session" "lock";
          };
          "Mod+Shift+M" = {
            desc = "Launch mail client";
            action = spawn "thunderbird";
          };
          "Mod+Shift+N" = {
            desc = "Mute notifications";
            action = noctalia "notification-dnd-toggle";
          };
          "Mod+Shift+P" = {
            desc = "Launch music player";
            action = spawn "spotify";
          };
          "Mod+Shift+T" = {
            desc = "Launch Telegram";
            action = spawn "AyuGram";
          };
          "Mod+Shift+V" = {
            desc = "Launch vibecode app";
            action = spawn "t3code";
          };
          "Mod+Shift+W" = {
            desc = "Launch ani-cli";
            action = spawn "ani-cli";
          };
          "Mod+Shift+X" = {
            desc = "Clear clipboard";
            action = noctalia "clipboard-clear";
          };

          "Mod+Shift+S" = {
            desc = "Take a screenshot";
            action = noctalia "screenshot-region";
          };
          # "Mod+Shift+Ctrl+S" = {
          #   desc = "Take a screenshot (window)";
          #   action = noctalia "screenshot-window";
          # };
          "Mod+Shift+Alt+S" = {
            desc = "Take a screenshot (screen)";
            action = noctalia "screenshot-fullscreen";
          };
          "Mod+Shift+Ctrl+Alt+S" = {
            desc = "Take a screenshot (all screens)";
            action = noctalia "screenshot-fullscreen" "all";
          };
        }
        // (
          let
            toggle_scratchpad = selector: command: fish "niri msg action close-window --id $(niri msg -j windows | jaq -c '.[] | select(${selector}) | .id') || ${command}";
          in {
            "Mod+Ctrl+A" = {
              desc = "Toggle anti RKN software";
              action = toggle_scratchpad ".title == \"AmneziaVPN\"" "AmneziaVPN";
            };
            "Mod+Ctrl+B" = {
              desc = "Toggle bluetooth";
              action = noctalia "bluetooth-toggle";
            };
            "Mod+Ctrl+M" = {
              desc = "Toggle monitor configuration menu";
              action = toggle_scratchpad ".app_id == \"nwg-displays\"" "nwg-displays";
            };
            "Mod+Ctrl+N" = {
              desc = "Toggle night mode";
              action = noctalia "nightlight-force-toggle";
            };
            "Mod+Ctrl+P" = {
              desc = "Toggle airplane mode";
              action = fish "toggle_airplane_mode";
            };
            "Mod+Ctrl+V" = {
              desc = "Toggle volume menu";
              action = toggle_scratchpad ".app_id == \"org.pulseaudio.pavucontrol\"" "pavucontrol";
            };
            "Mod+Ctrl+W" = {
              desc = "Toggle wi-fi";
              action = noctalia "wifi-toggle";
            };
          }
        )
        // {
          "Mod+K" = {
            desc = "Focus the window above";
            action = focus-window-up;
          };
          "Mod+J" = {
            desc = "Focus the window below";
            action = focus-window-down;
          };
          "Mod+H" = {
            desc = "Focus the column to the left";
            action = focus-column-left;
          };
          "Mod+L" = {
            desc = "Focus the column to the right";
            action = focus-column-right;
          };
          "Mod+Shift+K" = {
            desc = "Move the focused window up in a column";
            action = move-window-up;
          };
          "Mod+Shift+J" = {
            desc = "Move the focused window down in a column";
            action = move-window-down;
          };
          "Mod+Shift+H" = {
            desc = "Move the focused column to the left";
            action = move-column-left;
          };
          "Mod+Shift+L" = {
            desc = "Move the focused column to the right";
            action = move-column-right;
          };

          "Mod+Alt+T" = {
            desc = "Toggle the focused column between normal and tabbed display";
            action = toggle-column-tabbed-display;
          };
          "Mod+Bracketleft" = {
            desc = "Consume or expel the focused window left";
            action = consume-or-expel-window-left;
          };
          "Mod+Bracketright" = {
            desc = "Consume or expel the focused window right";
            action = consume-or-expel-window-right;
          };

          "Mod+Home" = {
            desc = "Focus the first column";
            action = focus-column-first;
          };
          "Mod+End" = {
            desc = "Focus the last column";
            action = focus-column-last;
          };
          "Mod+Shift+Home" = {
            desc = "Move the focused column to the start of the workspace";
            action = move-column-to-first;
          };
          "Mod+Shift+End" = {
            desc = "Move the focused column to the end of the workspace";
            action = move-column-to-last;
          };

          "Mod+Minus" = {
            desc = "Decrease the width of the focused window";
            action = set-window-width "-5%";
            repeat = true;
          };
          "Mod+Plus" = {
            desc = "Increase the width of the focused window";
            action = set-window-width "+5%";
            repeat = true;
          };
          "Mod+Shift+Minus" = {
            desc = "Decrease the height of the focused window";
            action = set-window-height "-5%";
            repeat = true;
          };
          "Mod+Shift+Plus" = {
            desc = "Increase the height of the focused window";
            action = set-window-height "+5%";
            repeat = true;
          };

          "Mod+WheelScrollDown" = {
            desc = "Focus the workspace below";
            action = focus-workspace-down;
            cooldown-ms = 150;
          };
          "Mod+WheelScrollUp" = {
            desc = "Focus the workspace above";
            action = focus-workspace-up;
            cooldown-ms = 150;
          };
          "Mod+Shift+WheelScrollDown" = {
            desc = "Move the focused workspace down";
            action = move-workspace-down;
            cooldown-ms = 150;
          };
          "Mod+Shift+WheelScrollUp" = {
            desc = "Move the focused workspace up";
            action = move-workspace-up;
            cooldown-ms = 150;
          };

          "Mod+Ctrl+WheelScrollDown" = {
            desc = "Focus the column to the left";
            action = focus-column-left;
            cooldown-ms = 150;
          };
          "Mod+Ctrl+WheelScrollUp" = {
            desc = "Focus the column to the right";
            action = focus-column-right;
            cooldown-ms = 150;
          };
          "Mod+Ctrl+Shift+WheelScrollDown" = {
            desc = "Move the focused column to the left";
            action = move-column-left;
            cooldown-ms = 150;
          };
          "Mod+Ctrl+Shift+WheelScrollUp" = {
            desc = "Move the focused column to the right";
            action = move-column-right;
            cooldown-ms = 150;
          };

          "Mod+Page_Down" = {
            desc = "Focus the workspace below";
            action = focus-workspace-down;
          };
          "Mod+Page_Up" = {
            desc = "Focus the workspace above";
            action = focus-workspace-up;
          };
          "Mod+Shift+Page_Down" = {
            desc = "Move the focused workspace down";
            action = move-workspace-down;
          };
          "Mod+Shift+Page_Up" = {
            desc = "Move the focused workspace up";
            action = move-workspace-up;
          };

          "Mod+Alt+K" = {
            desc = "Focus the monitor above";
            action = focus-monitor-up;
          };
          "Mod+Alt+J" = {
            desc = "Focus the monitor below";
            action = focus-monitor-down;
          };
          "Mod+Alt+H" = {
            desc = "Focus the monitor to the left";
            action = focus-monitor-left;
          };
          "Mod+Alt+L" = {
            desc = "Focus the monitor to the right";
            action = focus-monitor-right;
          };

          "Mod+Alt+Shift+K" = {
            desc = "Move the focused window to the monitor above";
            action = move-window-to-monitor-up;
          };
          "Mod+Alt+Shift+J" = {
            desc = "Move the focused window to the monitor below";
            action = move-window-to-monitor-down;
          };
          "Mod+Alt+Shift+H" = {
            desc = "Move the focused window to the monitor to the left";
            action = move-window-to-monitor-left;
          };
          "Mod+Alt+Shift+L" = {
            desc = "Move the focused window to the monitor to the right";
            action = move-window-to-monitor-right;
          };

          "Mod+Alt+Ctrl+K" = {
            desc = "Move the focused column to the monitor above";
            action = move-column-to-monitor-up;
          };
          "Mod+Alt+Ctrl+J" = {
            desc = "Move the focused column to the monitor below";
            action = move-column-to-monitor-down;
          };
          "Mod+Alt+Ctrl+H" = {
            desc = "Move the focused column to the monitor to the left";
            action = move-column-to-monitor-left;
          };
          "Mod+Alt+Ctrl+L" = {
            desc = "Move the focused column to the monitor to the right";
            action = move-column-to-monitor-right;
          };

          "Mod+Alt+Ctrl+Shift+K" = {
            desc = "Move the focused workspace to the monitor above";
            action = move-workspace-to-monitor-up;
          };
          "Mod+Alt+Ctrl+Shift+J" = {
            desc = "Move the focused workspace to the monitor below";
            action = move-workspace-to-monitor-down;
          };
          "Mod+Alt+Ctrl+Shift+H" = {
            desc = "Move the focused workspace to the monitor to the left";
            action = move-workspace-to-monitor-left;
          };
          "Mod+Alt+Ctrl+Shift+L" = {
            desc = "Move the focused workspace to the monitor to the right";
            action = move-workspace-to-monitor-right;
          };

          "XF86MonBrightnessUp" = {
            desc = "Increase brightness";
            action = noctalia "brightness-up";
            allow-when-locked = true;
            repeat = true;
          };
          "XF86MonBrightnessDown" = {
            desc = "Decrease brightness";
            action = noctalia "brightness-down";
            allow-when-locked = true;
            repeat = true;
          };

          "XF86AudioRaiseVolume" = {
            desc = "Increase volume";
            action = noctalia "volume-up";
            allow-when-locked = true;
            repeat = true;
          };
          "XF86AudioLowerVolume" = {
            desc = "Decrease volume";
            action = noctalia "volume-down";
            allow-when-locked = true;
            repeat = true;
          };
          "Ctrl+XF86AudioRaiseVolume" = {
            desc = "Increase volume by 1%";
            action = noctalia "volume-up" "1";
            allow-when-locked = true;
            repeat = true;
          };
          "Ctrl+XF86AudioLowerVolume" = {
            desc = "Decrease volume by 1%";
            action = noctalia "volume-down" "1";
            allow-when-locked = true;
            repeat = true;
          };

          "XF86AudioMute" = {
            desc = "Mute audio";
            action = noctalia "volume-mute";
            allow-when-locked = true;
          };
          "XF86AudioMicMute" = {
            desc = "Mute microphone";
            action = noctalia "mic-mute";
            allow-when-locked = true;
          };

          "XF86AudioPlay" = {
            desc = "Toggle media play/pause";
            action = noctalia "media" "toggle";
            allow-when-locked = true;
          };
          "XF86AudioPrev" = {
            desc = "Move to the previous track";
            action = noctalia "media" "previous";
            allow-when-locked = true;
          };
          "XF86AudioNext" = {
            desc = "Move to the next track";
            action = noctalia "media" "next";
            allow-when-locked = true;
          };

          "Mod+Ctrl+D" = {
            desc = "Power off all monitors via DPMS";
            action = noctalia "dpms-off";
            allow-when-locked = true;
          };
        }
      );

    recent-windows.binds = with recent-windows;
      mkBinds false {
        "Mod+Tab" = {
          desc = "Switch to the next recent window";
          action = next-window;
        };
        "Mod+Shift+Tab" = {
          desc = "Switch to the previous recent window";
          action = previous-window;
        };
      };
  };
}
