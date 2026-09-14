{
  programs.nixcord.config.plugins.songLink = {
    enable = true;
    includeMetadata = true;
    servicesSettings = {
      amazonMusic = {
        enabled = true;
        openInNative = false;
      };
      amazonStore = {
        enabled = true;
        openInNative = false;
      };
      anghami = {
        enabled = true;
        openInNative = false;
      };
      appleMusic = {
        enabled = true;
        openInNative = true;
      };
      audiomack = {
        enabled = true;
        openInNative = false;
      };
      audius = {
        enabled = true;
        openInNative = false;
      };
      bandcamp = {
        enabled = true;
        openInNative = false;
      };
      boomplay = {
        enabled = true;
        openInNative = false;
      };
      deezer = {
        enabled = true;
        openInNative = false;
      };
      google = {
        enabled = true;
        openInNative = false;
      };
      googleMusic = {
        enabled = true;
        openInNative = false;
      };
      itunes = {
        enabled = true;
        openInNative = true;
      };
      napster = {
        enabled = true;
        openInNative = false;
      };
      pandora = {
        enabled = true;
        openInNative = false;
      };
      soundcloud = {
        enabled = true;
        openInNative = false;
      };
      spinrilla = {
        enabled = true;
        openInNative = false;
      };
      spotify = {
        enabled = true;
        openInNative = true;
      };
      tidal = {
        enabled = true;
        openInNative = false;
      };
      yandex = {
        enabled = true;
        openInNative = false;
      };
      youtube = {
        enabled = true;
        openInNative = false;
      };
      youtubeMusic = {
        enabled = true;
        openInNative = false;
      };
    };
    userCountry = "US";
  };
}
