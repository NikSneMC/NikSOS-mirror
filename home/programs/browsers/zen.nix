{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.zen-browser.homeModules.beta];

  programs.zen-browser = let
    languagePacks = [
      "en-US"
      "en-GB"
      "ru"
      "ja"
    ];
  in {
    enable = true;

    icon = "${inputs.assets}/icons/zen-browser/icon.svg";

    inherit languagePacks;

    nativeMessagingHosts = with pkgs; [
      master.firefoxpwa
    ];

    policies = let
      DownloadDirectory = "$${home}/Downloads/Zen Browser";
    in {
      AIControls = {
        Default = {
          Value = "blocked";
          Locked = true;
        };
        Translations.Value = "available";
        PDFAltText.Value = "available";
      };
      AppAutoUpdate = false;
      DefaultDownloadDirectory = DownloadDirectory;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableSetDesktopBackground = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      inherit DownloadDirectory;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
        EmailTracking = true;
        SuspectedFingerprinting = true;
      };
      GenerativeAI = {
        Enabled = false;
        Locked = true;
      };
      NoDefaultBookmarks = true;
      RequestedLocales = languagePacks;
      SkipTermsOfUse = true;
      StartDownloadsInTempDirectory = true;
      TranslateEnabled = true;
      UserMessaging = {
        ExtensionRecommendations = false;
        FeatureRecommendations = false;
        UrlbarInterventions = false;
        SkipOnboarding = true;
        MoreFromMozilla = false;
        FirefoxLabs = false;
        Locked = true;
      };
    };

    setAsDefaultBrowser = true;
  };
}
