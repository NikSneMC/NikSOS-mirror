{
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.noctalia.homeModules.default
    ./bar.nix
    ./plugins.nix
    ./shell.nix
    ./theme.nix
  ];

  programs.noctalia = {
    enable = true;

    systemd.enable = true;

    settings = {
      audio = {
        enable_overdrive = true;
        enable_sounds = true;
        sound_volume = 0.5;
      };
      backdrop = {
        enabled = true;
        blur_intensity = 0.5;
        tint_intensity = 0.3;
      };
      battery.warning_threshold = 20;
      brightness.enable_ddcutil = true;
      calendar = {
        enabled = true;
        refresh_minutes = 15;
      };
      control_center = {
        shortcuts = [];
        sidebar = "full";
        sidebar_section = "full";
      };
      desktop_widgets.enabled = false;
      dock.enabled = false;
      hooks.started = [
        "noctalia msg notification-dnd-set on"
        "noctalia msg caffeine-enable"
      ];
      idle = {
        behavior = {
          lock = {
            action = "lock";
            command = "";
            enabled = false;
            resume_command = "";
            timeout = 600;
          };
          lock-and-suspend = {
            action = "lock_and_suspend";
            command = "";
            enabled = false;
            resume_command = "";
            timeout = 900;
          };
          screen-off = {
            action = "screen_off";
            command = "";
            enabled = false;
            resume_command = "";
            timeout = 660;
          };
        };
        behavior_order = [
          "lock"
          "screen-off"
          "lock-and-suspend"
        ];
        pre_action_fade_seconds = 2;
      };
      keybinds = {
        cancel = ["Escape"];
        down = ["Down"];
        left = ["Left"];
        right = ["Right"];
        up = ["Up"];
        validate = [
          "Return"
          "KP_Enter"
        ];
      };
      location.auto_locate = true;
      lockscreen = {
        enabled = true;
        blurred_desktop = false;
        fingerprint = true;
        tint_intensity = 0.3;
        wallpaper = config.theme.wallpaper;
      };
      lockscreen_widgets.enabled = false;
      nightlight = {
        enabled = true;
        temperature_day = 6500;
        temperature_night = 4000;
      };
      notification = {
        enable_daemon = true;
        background_opacity = 0.97;
        collapse_on_dismiss = true;
        layer = "overlay";
        position = "top_right";
        scale = 1;
        show_actions = true;
        show_app_name = true;
      };
      osd = {
        background_opacity = 0.97;
        kinds = {
          bluetooth = true;
          brightness = true;
          caffeine = true;
          dnd = true;
          keyboard_layout = true;
          lock_keys = true;
          media = false;
          nightlight = true;
          power_profile = true;
          privacy = true;
          volume = true;
          volume_input = true;
          volume_output = true;
          wifi = true;
        };
        offset_x = 20;
        offset_y = 8;
        orientation = "horizontal";
        position = "bottom_center";
        scale = 1;
      };
      system.monitor.enabled = true;
      weather = {
        effects = true;
        enabled = true;
        refresh_minutes = 30;
        unit = "metric";
      };
    };
  };
}
