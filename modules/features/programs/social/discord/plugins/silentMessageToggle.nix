{
  programs.nixcord.config.plugins.silentMessageToggle = {
    enable = true;
    persistState = "restarts";
  };
}
