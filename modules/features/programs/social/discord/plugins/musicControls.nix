{
  programs.nixcord.config.plugins.musicControls = {
    enable = true;
    fallbackProvider = true;
    hoverControls = false;
    lyricDelay = 0.0;
    lyricsConversion = "None";
    lyricsPosition = "below";
    lyricsProvider = "Spotify";
    previousButtonRestartsTrack = true;
    showFailedToasts = true;
    showMusicNoteOnNoLyrics = true;
    showSpotifyControls = true;
    showSpotifyLyrics = true;
    showTidalControls = true;
    showTidalLyrics = true;
    spotifyLyricsApiUrl = "https://spotify-lyrics-api-pi.vercel.app";
    translateTo = "en";
    useSpotifyUris = true;
    websocketUrl = "ws://localhost:24123";
  };
}
