{
  config,
  lib',
  ...
}: {
  programs.niri.settings.binds = with config.lib.niri.actions; let
    inherit (lib'.niri) mkBinds mkWorkspacesBinds mkColumnsBinds;

    fish = spawn "fish" "-c";
    noctalia = spawn "noctalia" "msg";
    noctalia-panel = noctalia "panel-toggle";
    noctalia-launcher = noctalia-panel "launcher";
    noctalia-control = noctalia-panel "control-center";
  in
    mkBinds (
      (mkWorkspacesBinds config)
      ++ (mkColumnsBinds 10)
      ++ [
        {
          bind = "Mod+Ctrl+K";
          desc = "Enter the `kill mode`";
          action = fish "pkill -9 -P $(niri msg -j pick-window | jaq .pid)";
        }
        {
          bind = "Mod+Ctrl+Alt+Shift+E";
          desc = "Exit niri";
          action = quit;
        }
        {
          bind = "Mod+Shift+Q";
          desc = "Close the focused window";
          action = close-window;
        }
      ]
      ++ [
        {
          bind = "Mod+M";
          desc = "Toggle the maximized state of the focused column";
          action = maximize-column;
        }
        {
          bind = "Mod+U";
          desc = "Switch between preset column widths backwards";
          action = switch-preset-column-width-back;
        }
        {
          bind = "Mod+P";
          desc = "Switch between preset column widths";
          action = switch-preset-column-width;
        }
      ]
      ++ [
        {
          bind = "F11";
          desc = "Toggle fullscreen on the focused window";
          action = fullscreen-window;
        }
        {
          bind = "Mod+F";
          desc = "Move the focused window between the floating and the tiling layout";
          action = toggle-window-floating;
        }
        {
          bind = "Mod+Ctrl+F";
          desc = "Toggles the focus between the floating and the tiling layout";
          action = switch-focus-between-floating-and-tiling;
        }
        {
          bind = "Mod+Alt+F";
          desc = "Toggles the windowed fullscreen status for the focused window";
          action = toggle-windowed-fullscreen;
        }
      ]
      ++ [
        {
          bind = "Mod+Alt+C";
          desc = "Clear dynamic cast target";
          action = clear-dynamic-cast-target;
        }
        {
          bind = "Mod+Alt+W";
          desc = "Select a window for dynamic cast target";
          action = set-dynamic-cast-window;
        }
        {
          bind = "Mod+Alt+M";
          desc = "Select an output for dynamic cast target";
          action = set-dynamic-cast-monitor;
        }
      ]
      ++ [
        {
          bind = "Mod+Ctrl+Alt+S";
          desc = "Reload noctalia";
          action = noctalia "config-reload";
        }
      ]
      ++ [
        {
          bind = "Mod+A";
          desc = "Launch app menu";
          action = noctalia-launcher;
        }
        {
          bind = "Mod+B";
          desc = "Launch primary browser";
          action = spawn "zen-beta";
        }
        {
          bind = "Mod+D";
          desc = "Launch Discord";
          action = spawn "vesktop";
        }
        {
          bind = "Mod+E";
          desc = "Launch file manager";
          action = spawn "thunar";
        }
        {
          bind = "Mod+I";
          desc = "Open noctalia settings";
          action = noctalia "settings-toggle";
        }
        {
          bind = "Mod+N";
          desc = "Open notification center";
          action = noctalia-control "notifications";
        }
        # {
        #   bind = "Mod+R";
        #   desc = "Execute command";
        #   action = noctalia-launcher "/run ";
        # }
        {
          bind = "Mod+T";
          desc = "Launch terminal";
          action = spawn "rio";
        }
        {
          bind = "Mod+V";
          desc = "Open clipboard history";
          action = noctalia-panel "clipboard";
        }
        # {
        #   bind = "Mod+X";
        #   desc = "Delete an item from the clipboard history";
        #   action = fish "noctalia clipboard search --json -l 1 | jq '.entries[0].id' | xargs noctalia clipboard delete";
        # }
        {
          bind = "Mod+Escape";
          desc = "Open logout menu";
          action = noctalia-panel "session";
        }
        {
          bind = "Mod+Semicolon";
          desc = "Open emoju menu";
          action = noctalia-launcher "/emo ";
        }
        {
          bind = "Mod+Alt+Tab";
          desc = "Toggle overview";
          action = toggle-overview;
        }
      ]
      ++ [
        {
          bind = "Mod+Shift+A";
          desc = "Open 2fa menu";
          action = noctalia-launcher "/2fa ";
        }
        {
          bind = "Mod+Shift+B";
          desc = "Launch secondary browser";
          action = spawn "helium";
        }
        {
          bind = "Mod+Shift+C";
          desc = "Launch color picker";
          action = spawn "hyprpicker" "--autocopy" "--notify" "--lowercase-hex";
        }
        {
          bind = "Mod+Shift+G";
          desc = "Lock session";
          action = noctalia "session" "lock";
        }
        {
          bind = "Mod+Shift+M";
          desc = "Launch mail client";
          action = spawn "thunderbird";
        }
        {
          bind = "Mod+Shift+N";
          desc = "Mute notifications";
          action = noctalia "notification-dnd-toggle";
        }
        {
          bind = "Mod+Shift+P";
          desc = "Launch music player";
          action = spawn "spotify";
        }
        {
          bind = "Mod+Shift+T";
          desc = "Launch Telegram";
          action = spawn "AyuGram";
        }
        {
          bind = "Mod+Shift+V";
          desc = "Launch vibecode app";
          action = spawn "t3code";
        }
        {
          bind = "Mod+Shift+W";
          desc = "Launch ani-cli";
          action = spawn "ani-cli" "--dmenu";
        }
        {
          bind = "Mod+Shift+X";
          desc = "Clear clipboard";
          action = noctalia "clipboard-clear";
        }
      ]
      ++ [
        {
          bind = "Mod+Shift+S";
          desc = "Take a screenshot";
          action = noctalia "screenshot-region";
        }
        # {
        #   bind = "Mod+Shift+Ctrl+S";
        #   desc = "Take a screenshot (window)";
        #   action = noctalia "screenshot-window";
        # }
        {
          bind = "Mod+Shift+Alt+S";
          desc = "Take a screenshot (screen)";
          action = noctalia "screenshot-fullscreen";
        }
        {
          bind = "Mod+Shift+Ctrl+Alt+S";
          desc = "Take a screenshot (all screens)";
          action = noctalia "screenshot-fullscreen" "all";
        }
      ]
      ++ (
        let
          toggle_scratchpad = selector: command: fish "niri msg action close-window --id $(niri msg -j windows | jaq -c '.[] | select(${selector}) | .id') || ${command}";
        in [
          {
            bind = "Mod+Ctrl+A";
            desc = "Toggle anti RKN software";
            action = toggle_scratchpad ".title == \"AmneziaVPN\"" "AmneziaVPN";
          }
          {
            bind = "Mod+Ctrl+B";
            desc = "Toggle bluetooth";
            action = noctalia "bluetooth-toggle";
          }
          {
            bind = "Mod+Ctrl+M";
            desc = "Toggle monitor configuration menu";
            action = toggle_scratchpad ".app_id == \"nwg-displays\"" "nwg-displays";
          }
          {
            bind = "Mod+Ctrl+N";
            desc = "Toggle night mode";
            action = noctalia "nightlight-force-toggle";
          }
          {
            bind = "Mod+Ctrl+P";
            desc = "Toggle airplane mode";
            action = fish "toggle_airplane_mode";
          }
          {
            bind = "Mod+Ctrl+V";
            desc = "Toggle volume menu";
            action = toggle_scratchpad ".app_id == \"org.pulseaudio.pavucontrol\"" "pavucontrol";
          }
          {
            bind = "Mod+Ctrl+W";
            desc = "Toggle wi-fi";
            action = noctalia "wifi-toggle";
          }
        ]
      )
      ++ [
        {
          bind = "Mod+K";
          desc = "Focus the window above";
          action = focus-window-up;
        }
        {
          bind = "Mod+J";
          desc = "Focus the window below";
          action = focus-window-down;
        }
        {
          bind = "Mod+H";
          desc = "Focus the column to the left";
          action = focus-column-left;
        }
        {
          bind = "Mod+L";
          desc = "Focus the column to the right";
          action = focus-column-right;
        }
        {
          bind = "Mod+Shift+K";
          desc = "Move the focused window up in a column";
          action = move-window-up;
        }
        {
          bind = "Mod+Shift+J";
          desc = "Move the focused window down in a column";
          action = move-window-down;
        }
        {
          bind = "Mod+Shift+H";
          desc = "Move the focused column to the left";
          action = move-column-left;
        }
        {
          bind = "Mod+Shift+L";
          desc = "Move the focused column to the right";
          action = move-column-right;
        }
      ]
      ++ [
        {
          bind = "Mod+Alt+T";
          desc = "Toggle the focused column between normal and tabbed display";
          action = toggle-column-tabbed-display;
        }
        {
          bind = "Mod+Bracketleft";
          desc = "Consume or expel the focused window left";
          action = consume-or-expel-window-left;
        }
        {
          bind = "Mod+Bracketright";
          desc = "Consume or expel the focused window right";
          action = consume-or-expel-window-right;
        }
      ]
      ++ [
        {
          bind = "Mod+Home";
          desc = "Focus the first column";
          action = focus-column-first;
        }
        {
          bind = "Mod+End";
          desc = "Focus the last column";
          action = focus-column-last;
        }
        {
          bind = "Mod+Shift+Home";
          desc = "Move the focused column to the start of the workspace";
          action = move-column-to-first;
        }
        {
          bind = "Mod+Shift+End";
          desc = "Move the focused column to the end of the workspace";
          action = move-column-to-last;
        }
      ]
      ++ [
        {
          bind = "Mod+Minus";
          desc = "Decrease the width of the focused window";
          action = set-window-width "-5%";
          repeat = true;
        }
        {
          bind = "Mod+Plus";
          desc = "Increase the width of the focused window";
          action = set-window-width "+5%";
          repeat = true;
        }
        {
          bind = "Mod+Shift+Minus";
          desc = "Decrease the height of the focused window";
          action = set-window-height "-5%";
          repeat = true;
        }
        {
          bind = "Mod+Shift+Plus";
          desc = "Increase the height of the focused window";
          action = set-window-height "+5%";
          repeat = true;
        }
      ]
      ++ [
        {
          bind = "Mod+WheelScrollDown";
          desc = "Focus the workspace below";
          action = focus-workspace-down;
          cooldown-ms = 150;
        }
        {
          bind = "Mod+WheelScrollUp";
          desc = "Focus the workspace above";
          action = focus-workspace-up;
          cooldown-ms = 150;
        }
        {
          bind = "Mod+Shift+WheelScrollDown";
          desc = "Move the focused workspace down";
          action = move-workspace-down;
          cooldown-ms = 150;
        }
        {
          bind = "Mod+Shift+WheelScrollUp";
          desc = "Move the focused workspace up";
          action = move-workspace-up;
          cooldown-ms = 150;
        }
      ]
      ++ [
        {
          bind = "Mod+Ctrl+WheelScrollDown";
          desc = "Focus the column to the left";
          action = focus-column-left;
          cooldown-ms = 150;
        }
        {
          bind = "Mod+Ctrl+WheelScrollUp";
          desc = "Focus the column to the right";
          action = focus-column-right;
          cooldown-ms = 150;
        }
        {
          bind = "Mod+Ctrl+Shift+WheelScrollDown";
          desc = "Move the focused column to the left";
          action = move-column-left;
          cooldown-ms = 150;
        }
        {
          bind = "Mod+Ctrl+Shift+WheelScrollUp";
          desc = "Move the focused column to the right";
          action = move-column-right;
          cooldown-ms = 150;
        }
      ]
      ++ [
        {
          bind = "Mod+Page_Down";
          desc = "Focus the workspace below";
          action = focus-workspace-down;
        }
        {
          bind = "Mod+Page_Up";
          desc = "Focus the workspace above";
          action = focus-workspace-up;
        }
        {
          bind = "Mod+Shift+Page_Down";
          desc = "Move the focused workspace down";
          action = move-workspace-down;
        }
        {
          bind = "Mod+Shift+Page_Up";
          desc = "Move the focused workspace up";
          action = move-workspace-up;
        }
      ]
      ++ [
        {
          bind = "Mod+Alt+K";
          desc = "Focus the monitor above";
          action = focus-monitor-up;
        }
        {
          bind = "Mod+Alt+J";
          desc = "Focus the monitor below";
          action = focus-monitor-down;
        }
        {
          bind = "Mod+Alt+H";
          desc = "Focus the monitor to the left";
          action = focus-monitor-left;
        }
        {
          bind = "Mod+Alt+L";
          desc = "Focus the monitor to the right";
          action = focus-monitor-right;
        }
      ]
      ++ [
        {
          bind = "Mod+Alt+Shift+K";
          desc = "Move the focused window to the monitor above";
          action = move-window-to-monitor-up;
        }
        {
          bind = "Mod+Alt+Shift+J";
          desc = "Move the focused window to the monitor below";
          action = move-window-to-monitor-down;
        }
        {
          bind = "Mod+Alt+Shift+H";
          desc = "Move the focused window to the monitor to the left";
          action = move-window-to-monitor-left;
        }
        {
          bind = "Mod+Alt+Shift+L";
          desc = "Move the focused window to the monitor to the right";
          action = move-window-to-monitor-right;
        }
      ]
      ++ [
        {
          bind = "Mod+Alt+Ctrl+K";
          desc = "Move the focused column to the monitor above";
          action = move-column-to-monitor-up;
        }
        {
          bind = "Mod+Alt+Ctrl+J";
          desc = "Move the focused column to the monitor below";
          action = move-column-to-monitor-down;
        }
        {
          bind = "Mod+Alt+Ctrl+H";
          desc = "Move the focused column to the monitor to the left";
          action = move-column-to-monitor-left;
        }
        {
          bind = "Mod+Alt+Ctrl+L";
          desc = "Move the focused column to the monitor to the right";
          action = move-column-to-monitor-right;
        }
      ]
      ++ [
        {
          bind = "Mod+Alt+Ctrl+Shift+K";
          desc = "Move the focused workspace to the monitor above";
          action = move-workspace-to-monitor-up;
        }
        {
          bind = "Mod+Alt+Ctrl+Shift+J";
          desc = "Move the focused workspace to the monitor below";
          action = move-workspace-to-monitor-down;
        }
        {
          bind = "Mod+Alt+Ctrl+Shift+H";
          desc = "Move the focused workspace to the monitor to the left";
          action = move-workspace-to-monitor-left;
        }
        {
          bind = "Mod+Alt+Ctrl+Shift+L";
          desc = "Move the focused workspace to the monitor to the right";
          action = move-workspace-to-monitor-right;
        }
      ]
      ++ [
        {
          bind = "XF86MonBrightnessUp";
          desc = "Increase brightness";
          action = noctalia "brightness-up";
          allow-when-locked = true;
          repeat = true;
        }
        {
          bind = "XF86MonBrightnessDown";
          desc = "Decrease brightness";
          action = noctalia "brightness-down";
          allow-when-locked = true;
          repeat = true;
        }
      ]
      ++ [
        {
          bind = "XF86AudioRaiseVolume";
          desc = "Increase volume";
          action = noctalia "volume-up";
          allow-when-locked = true;
          repeat = true;
        }
        {
          bind = "XF86AudioLowerVolume";
          desc = "Decrease volume";
          action = noctalia "volume-down";
          allow-when-locked = true;
          repeat = true;
        }
        {
          bind = "Ctrl+XF86AudioRaiseVolume";
          desc = "Increase volume by 1%";
          action = noctalia "volume-up" "1";
          allow-when-locked = true;
          repeat = true;
        }
        {
          bind = "Ctrl+XF86AudioLowerVolume";
          desc = "Decrease volume by 1%";
          action = noctalia "volume-down" "1";
          allow-when-locked = true;
          repeat = true;
        }
      ]
      ++ [
        {
          bind = "XF86AudioMute";
          desc = "Mute audio";
          action = noctalia "volume-mute";
          allow-when-locked = true;
        }
        {
          bind = "XF86AudioMicMute";
          desc = "Mute microphone";
          action = noctalia "mic-mute";
          allow-when-locked = true;
        }
      ]
      ++ [
        {
          bind = "XF86AudioPlay";
          desc = "Toggle media play/pause";
          action = noctalia "media" "toggle";
          allow-when-locked = true;
        }
        {
          bind = "XF86AudioPrev";
          desc = "Move to the previous track";
          action = noctalia "media" "previous";
          allow-when-locked = true;
        }
        {
          bind = "XF86AudioNext";
          desc = "Move to the next track";
          action = noctalia "media" "next";
          allow-when-locked = true;
        }
      ]
      ++ [
        {
          bind = "Mod+Ctrl+D";
          desc = "Power off all monitors via DPMS";
          action = noctalia "dpms-off";
        }
      ]
    );
}
