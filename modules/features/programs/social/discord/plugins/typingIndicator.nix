{
  programs.nixcord.config.plugins.typingIndicator = {
    enable = true;
    includeBlockedUsers = false;
    includeCurrentChannel = true;
    includeIgnoredUsers = false;
    includeMutedChannels = false;
    indicatorMode = 3;
  };
}
