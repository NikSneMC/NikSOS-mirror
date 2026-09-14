{
  programs.nixcord.config.plugins.betterActivities = {
    enable = true;
    allActivitiesStyle = "carousel";
    hideTooltip = true;
    iconSize = 15.0;
    memberList = true;
    removeGameActivityStatus = false;
    renderGifs = true;
    specialFirst = true;
    userPopout = true;
  };
}
