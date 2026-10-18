{
  den.aspects.udiskie = {
    homeManager = {pkgs, ...}: {
      services.udiskie = {
        enable = true;
        tray = "never";
        automount = false;
      };

      home.packages = with pkgs; [
        udiskie
      ];
    };
  };
}
