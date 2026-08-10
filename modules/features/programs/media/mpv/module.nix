{
  den.aspects.mpv = {
    homeManager = {pkgs, ...}: {
      programs.mpv = {
        enable = true;
        defaultProfiles = ["gpu-hq"];
        scripts = with pkgs.mpvScripts; [
          mpris
        ];

        config = {
          save-position-on-quit = true;
        };
      };
    };
  };
}
