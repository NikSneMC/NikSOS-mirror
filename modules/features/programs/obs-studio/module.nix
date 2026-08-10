{
  den.aspects.obs-studio = {
    os = {pkgs, ...}: {
      programs.obs-studio = {
        enable = true;
        enableVirtualCamera = true;
        plugins = with pkgs.obs-studio-plugins; [
          wlrobs
          obs-vkcapture
        ];
      };
    };

    homeManager = {
      programs.obs-studio = {
        enable = true;
        plugins = [];
      };
    };
  };
}
