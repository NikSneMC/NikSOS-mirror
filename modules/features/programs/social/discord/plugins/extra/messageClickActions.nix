{
  programs.nixcord.extraConfig.plugins.messageClickActions = {
    enableDeleteOnClick = true;
    enableDoubleClickToEdit = true;
    enableDoubleClickToReply = true;
    requireModifier = false;
  };
}
