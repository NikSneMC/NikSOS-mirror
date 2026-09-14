{
  programs.nixcord.config.plugins.replaceGoogleSearch = {
    enable = true;
    replacementEngine = "custom";
    customEngineName = "DuckDuckGo";
  };
}
