{
  programs.nixcord.config.plugins.dragify = {
    enable = true;
    allowChatBodyDrop = false;
    channelOutput = "mention";
    inviteExpireAfter = 0;
    inviteMaxUses = 0;
    inviteTemporaryMembership = true;
    reuseExistingInvites = true;
    userOutput = "mention";
  };
}
