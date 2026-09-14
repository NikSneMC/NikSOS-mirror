{
  programs.nixcord.config.plugins.betterForwards = {
    enable = true;
    dontFollowForwards = false;
    forwardPreface = ">";
    resendOnFail = true;
    selfForward = false;
  };
}
