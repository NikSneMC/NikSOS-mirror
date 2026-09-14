{
  programs.nixcord.config.plugins.messageBurst = {
    enable = true;
    shouldMergeWithAttachment = false;
    timePeriod = 3;
    useSpace = false;
  };
}
