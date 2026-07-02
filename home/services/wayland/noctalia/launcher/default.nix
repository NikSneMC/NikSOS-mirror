{
  imports = [
    ./2fa.nix
  ];

  programs.noctalia.settings.shell.launcher = {
    app_grid = false;
    categories = false;
    compact = false;
    dmenu = {};
    session_search = true;
    show_icons = true;
    sort_by_usage = true;
  };
}
