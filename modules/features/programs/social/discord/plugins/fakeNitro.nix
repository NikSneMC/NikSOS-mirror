{
  programs.nixcord.config.plugins.fakeNitro = {
    enable = true;
    transformCompoundSentence = true;
    disableEmbedPermissionCheck = true;
  };
}
