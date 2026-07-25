{
  imports = [
    ./2fa.nix
    ./run.nix
  ];

  programs.noctalia.settings.shell.launcher = {
    app_grid = false;
    auto_paste = "auto";
    categories = false;
    compact = false;
    fetch_exchange_rates = true;
    provider_prefix = "/";
    show_icons = true;
    sort_by_usage = true;
  };
}
