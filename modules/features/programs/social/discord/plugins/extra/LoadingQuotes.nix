{
  programs.nixcord.extraConfig.plugins.LoadingQuotes = {
    enabled = true;
    additionalQuotes = "";
    additionalQuotesDelimiter = "|";
    enableDiscordPresetQuotes = false;
    enablePluginPresetQuotes = true;
    replaceEvents = true;
  };
}
