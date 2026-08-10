{
  den.aspects.intel = {
    os = {pkgs, ...}: {
      hardware.graphics.extraPackages = with pkgs; [
        vaapiIntel
        intel-media-driver
      ];
    };
  };
}
