{
  imports = [
    ./2fa.nix
  ];

  programs.noctalia.settings.shell.launcher = {
    app_grid = false;
    auto_paste = "auto";
    categories = false;
    compact = false;
    default_view = "recent";
    fetch_exchange_rates = true;
    layout = "simple";
    panels = {
      ignored = [
        "polkit"
        "setup-wizard"
        "test"
        "launcher"
      ];
    };
    provider_prefix = "/";
    search_position = "bottom";
    show_app_actions = false;
    show_app_origin_indicator = true;
    show_icons = true;
    show_session_button = false;
    show_settings_button = false;
    sort_by_usage = true;
    track_usage = true;
  };
}
