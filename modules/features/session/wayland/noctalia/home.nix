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
        enable_notification_sounds = true;
        enable_overdrive = true;
        enable_power_sounds = true;
        enable_screenshot_sounds = true;
        enable_sounds = true;
        enable_volume_sounds = true;
        sound_theme = "freedesktop";
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
        event_date_format = "%A %e %B";
        event_time_format = "%H:%M";
        dedupe_events = true;
        reminders = {
          enabled = true;
          use_event_reminders = true;
          all_day_digest_time = "09:00";
          default_lead_minutes = 10;
        };
      };
      control_center = {
        calendar = {
          show_events_card = true;
          show_week_numbers = true;
        };
        hidden_tabs = [];
        shortcuts = [];
        show_session_button = true;
        show_shortcut_labels = false;
        sidebar = "full";
        sidebar_section = "full";
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
        copy = ["Ctrl+c"];
        delete = ["Delete"];
        down = ["Down"];
        left = ["Left"];
        right = ["Right"];
        save = ["Ctrl+s"];
        tab_next = ["Tab"];
        tab_previous = ["Shift+ISO_Left_Tab"];
        up = ["Up"];
        validate = ["Return" "KP_Enter"];
      };
      location.auto_locate = true;
      lockscreen = {
        enabled = true;
        allow_empty_password = false;
        fingerprint = true;
        lock_before_suspend = true;
        blurred_desktop = false;
        wallpaper = config.theme.wallpaper;
        edge_smoothness = 0.3;
        grace_period_seconds = 0;
        tint_intensity = 0.3;
        transition = ["honeycomb"];
        transition_duration = 750;
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
        keep_dismissed_in_history = true;
        layer = "overlay";
        position = "top_right";
        border = true;
        border_width = 1.0;
        border_color = "outline";
        scale = 1;
        show_actions = true;
        show_app_name = true;
        offset_x = 20;
        offset_y = 8;
        width = 360;
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
        hide_delay_ms = 100;
        border = true;
        border_width = 1.0;
        border_color = "outline";
        background_opacity = 0.97;
        offset_x = 20;
        offset_y = 8;
        orientation = "horizontal";
        position = "bottom_center";
        position_vertical = "bottom_center";
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
