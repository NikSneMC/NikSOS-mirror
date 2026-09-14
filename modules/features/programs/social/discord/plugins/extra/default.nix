{
  imports = [
    ./CollapsibleUI.nix
    ./fakeNitro.nix
    ./LoadingQuotes.nix
    ./messageClickActions.nix
    ./platformIndicators.nix
    ./showHiddenChannels.nix
    ./showMeYourName.nix
    ./silentTyping.nix
  ];

  programs.nixcord.extraConfig.plugins.LoginWithQR.enabled = true;
}
