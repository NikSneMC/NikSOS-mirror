{config, ...}: {
  programs.noctalia.settings.shell = {
    animation = {
      enabled = true;
      speed = 1;
    };
    app_icon_colorize = false;
    avatar_path = "/var/lib/AccountsService/icons/${config.home.user}";
    clipboard_enabled = true;
    clipboard_auto_paste = "auto";
    clipboard_confirm_clear_history = true;
    clipboard_history_max_entries = 100;
    clipboard_image_action_command = "";
    corner_radius_scale = 1;
    date_format = "%A, %x";
    disable_mipmaps = false;
    font_family = "JetBrainsMono NFP";
    launch_apps_as_systemd_services = true;
    middle_click_opens_widget_settings = true;
    niri_overview_type_to_launch_enabled = false;
    offline_mode = false;
    panel = {
      borders = true;
      clipboard_placement = "centered";
      control_center_placement = "centered";
      launcher_categories = false;
      launcher_compact = false;
      launcher_placement = "centered";
      launcher_session_search = true;
      launcher_show_icons = true;
      launcher_sort_by_usage = true;
      open_near_click_clipboard = true;
      open_near_click_control_center = true;
      open_near_click_launcher = true;
      open_near_click_session = true;
      open_near_click_wallpaper = true;
      session_placement = "centered";
      shadow = true;
      transparency_mode = "glass";
      wallpaper_placement = "attached";
    };
    password_style = "random";
    polkit_agent = true;
    screen_corners = {
      enabled = false;
      size = 32;
    };
    screen_time_enabled = true;
    screenshot = {
      copy_to_clipboard = true;
      directory = config.xdg.userDirs.extraConfig.SCREENSHOTS;
      filename_pattern = "";
      freeze_screen = true;
      pipe_command = "";
      pipe_to_command = false;
      save_to_file = true;
    };
    session.actions = [
      {
        action = "lock";
        command = "";
        enabled = true;
        glyph = "";
        label = "";
        shortcut = "1";
        variant = "default";
      }
      {
        action = "logout";
        command = "";
        enabled = true;
        glyph = "";
        label = "";
        shortcut = "2";
        variant = "default";
      }
      {
        action = "lock_and_suspend";
        command = "";
        enabled = true;
        glyph = "";
        label = "";
        shortcut = "3";
        variant = "default";
      }
      {
        action = "reboot";
        command = "";
        enabled = true;
        glyph = "";
        label = "";
        shortcut = "4";
        variant = "default";
      }
      {
        action = "shutdown";
        command = "";
        enabled = true;
        glyph = "";
        label = "";
        shortcut = "5";
        variant = "destructive";
      }
    ];
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
    ui_scale = 1;
  };
}
