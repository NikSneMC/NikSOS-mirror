{
  programs.nixcord.config.plugins.scheduledMessages = {
    enable = true;
    checkIntervalSeconds = 10.0;
    maxMessagesPerMinute = 1.0;
    showNotifications = true;
    showPhantomMessages = true;
  };
}
