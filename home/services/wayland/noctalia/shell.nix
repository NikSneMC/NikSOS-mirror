{config, ...}: {
  programs.noctalia.settings.shell = {
    animation = {
      enabled = true;
      speed = 1;
    };
    app_icon_colorize = false;
    avatar_path = "/var/lib/AccountsService/icons/${config.home.user}";
    button_borders = true;
    clipboard_enabled = true;
    clipboard_auto_paste = "auto";
    clipboard_confirm_clear_history = true;
    clipboard_history_max_entries = 100;
    clipboard_image_action_command = "";
    corner_radius_scale = 1;
    date_format = "%A, %x";
    disable_mipmaps = false;
    external_ip_enabled = false;
    font_family = "JetBrainsMono NFP";
    greeter_sync.auto_sync = true;
    input_borders = true;
    launch_apps_as_systemd_services = true;
    middle_click_opens_widget_settings = true;
    niri_overview_type_to_launch_enabled = false;
    offline_mode = false;
    panel = {
      borders = true;
      clipboard_placement = "floating";
      clipboard_position = "center";
      control_center_placement = "floating";
      control_center_position = "center";
      floating_offset = 8;
      launcher_placement = "floating";
      launcher_position = "center";
      list_item_background = false;
      open_near_click_clipboard = true;
      open_near_click_control_center = true;
      open_near_click_launcher = true;
      open_near_click_session = true;
      open_near_click_wallpaper = true;
      polkit_placement = "floating";
      polkit_position = "center";
      session_placement = "floating";
      session_position = "center";
      shadow = false;
      transparency_mode = "glass";
      wallpaper_placement = "floating";
      wallpaper_position = "auto";
    };
    panel_anchor_bar = "main";
    password_style = "random";
    polkit_agent = true;
    popup_borders = true;
    popup_shadows = true;
    privacy.mic_filter_regex = "^DeepFilter Noise Canceling source$";
    screen_corners.enabled = false;
    screen_time_enabled = true;
    screenshot = {
      confirm_region = true;
      copy_to_clipboard = true;
      directory = config.xdg.userDirs.extraConfig.SCREENSHOTS;
      filename_pattern = "";
      freeze_screen = true;
      pipe_command = "";
      pipe_to_command = false;
      save_to_file = true;
      show_cursor = true;
    };
    session = {
      actions = let
        countdown_seconds = 3;
      in [
        {
          action = "lock";
          command = "";
          enabled = true;
          glyph = "";
          label = "";
          shortcut = "l";
          variant = "default";
          inherit countdown_seconds;
        }
        {
          action = "logout";
          command = "";
          enabled = true;
          glyph = "";
          label = "";
          shortcut = "e";
          variant = "default";
          inherit countdown_seconds;
        }
        {
          action = "lock_and_suspend";
          command = "";
          enabled = true;
          glyph = "";
          label = "";
          shortcut = "u";
          variant = "default";
          inherit countdown_seconds;
        }
        {
          action = "reboot";
          command = "";
          enabled = true;
          glyph = "";
          label = "";
          shortcut = "r";
          variant = "default";
          inherit countdown_seconds;
        }
        {
          action = "shutdown";
          command = "";
          enabled = true;
          glyph = "";
          label = "";
          shortcut = "s";
          variant = "destructive";
          inherit countdown_seconds;
        }
      ];
      show_shortcuts = true;
    };
    settings_show_advanced = true;
    setup_wizard_enabled = false;
    shadow = {
      alpha = 0.55;
      direction = "down";
    };
    shared_gl_context = true;
    show_location = true;
    telemetry_enabled = false;
    time_format = "{:%H:%M}";
  };
}
