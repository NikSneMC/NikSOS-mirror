{
  den.aspects.steam = {
    os = {pkgs, ...}: {
      programs.steam = {
        enable = true;
        package = pkgs.steam.override {
          extraPkgs = p:
            with p; [
              SDL2
              openal
              libglvnd
              gtk3
              mono
            ];
        };
        protontricks.enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        localNetworkGameTransfers.openFirewall = true;
      };
    };
  };
}
