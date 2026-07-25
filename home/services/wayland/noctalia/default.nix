{
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.noctalia.homeModules.default
    ./launcher
    ./bar.nix
    ./plugins.nix
    ./shell.nix
    ./theme.nix
  ];

  programs.noctalia = {
    enable = true;

    systemd.enable = true;

    settings = {
      accessibility = {
        high_contrast = false;
        ui_scale = 1;
      };
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
      brightness = {
        enable_ddcutil = true;
        minimum_brightness = 0.05;
        sync_all_monitors = false;
      };
      calendar = {
        enabled = true;
        refresh_minutes = 15;
      };
      control_center = {
        calendar = {
          event_date_format = "%A %e %B";
          event_time_format = "%H:%M";
          show_events_card = true;
          show_week_numbers = true;
        };
        sidebar = "full";
        sidebar_section = "full";
        width = 700;
      };
      desktop_widgets.enabled = false;
      dock.enabled = false;
      hooks.started = [
        "noctalia msg notification-dnd-set on"
        "noctalia msg caffeine-enable"
      ];
      hot_corners.enabled = false;
      idle = {
        behavior = {
          lock = {
            enabled = true;
            action = "lock";
            timeout = 300;
          };
          lock-and-suspend = {
            enabled = true;
            action = "lock_and_suspend";
            timeout = 900;
          };
          screen-off = {
            enabled = true;
            action = "screen_off";
            timeout = 600;
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
        tab_next = ["Tab"];
        tab_previous = ["Shift+ISO_Left_Tab"];
        up = ["Up"];
        validate = [
          "Return"
          "KP_Enter"
        ];
      };
      location.auto_locate = true;
      lockscreen = {
        enabled = true;
        allow_empty_password = false;
        fingerprint = false;
        blurred_desktop = false;
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
        border = true;
        scale = 1;
        show_actions = true;
        show_app_name = true;
        offset_x = 20;
        offset_y = 8;
      };
      osd = {
        enabled = true;
        kinds = {
          bluetooth = true;
          brightness = true;
          caffeine = true;
          dnd = true;
          keyboard_backlight = true;
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
        border = true;
        background_opacity = 0.97;
        offset_x = 20;
        offset_y = 8;
        orientation = "horizontal";
        position = "bottom_center";
        position_vertical = "top_center";
        scale = 1;
      };
      storage = {
        key_file = "";
        key_source = "secret-service";
      };
      system.monitor.enabled = true;
      weather = {
        effects = true;
        enabled = true;
        refresh_minutes = 10;
        unit = "metric";
      };
    };
  };
}
