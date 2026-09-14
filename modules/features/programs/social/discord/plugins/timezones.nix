{
  programs.nixcord.config.plugins.timezones = {
    enable = true;
    askedTimezone = false;
    databaseUrl = "https://timezone.creations.works";
    preferDatabaseOverLocal = true;
    recipientTimezoneInDms = false;
    showLocalTimezone = false;
    showMessageHeaderTime = true;
    showProfileTime = true;
    showTimezoneInfo = true;
    twentyFourHourFormat = true;
    useDatabase = true;
    showOwnTimezone = true;
  };
}
