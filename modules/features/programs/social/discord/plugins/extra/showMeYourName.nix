{
  programs.nixcord.extraConfig.plugins.showMeYourName = {
    mode = "nick-user";
    friendNicknames = "dms";
    displayNames = false;
    inReplies = true;
  };
}
