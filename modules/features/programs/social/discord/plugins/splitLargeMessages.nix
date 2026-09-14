{
  programs.nixcord.config.plugins.splitLargeMessages = {
    enable = true;
    sendDelay = 1.0;
    slowmodeMax = 5.0;
    splitInSlowmode = false;
    splitMode = "newlines";
  };
}
