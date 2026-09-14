{
  programs.nixcord.config.plugins.equibopStreamFixes = {
    enable = true;
    bitsPerPixelPct = 8;
    forceEncoderSettings = true;
    keyframeInterval = 5000;
    minBitrate = 500;
    preventDownscale = true;
    preventFramerateReduction = true;
    raiseBitrateCaps = true;
    removeResolutionCap = true;
    unlockQualityOptions = true;
  };
}
