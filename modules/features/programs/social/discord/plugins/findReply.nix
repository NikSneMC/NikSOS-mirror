{
  programs.nixcord.config.plugins.findReply = {
    enable = true;
    hideButtonIfNoReply = true;
    includeAuthor = true;
    includePings = true;
  };
}
