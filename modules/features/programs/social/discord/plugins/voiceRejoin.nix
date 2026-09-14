{
  programs.nixcord.config.plugins.voiceRejoin = {
    enable = true;
    applyOnlyToDms = false;
    preventReconnectIfCallEnded = "both";
    rejoinDelay = 2.0;
    rejoinTimeout = 30.0;
  };
}
