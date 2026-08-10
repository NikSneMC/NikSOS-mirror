{den, ...}: {
  den.aspects.gimp = {
    includes = with den.aspects; [
      gdk-pixbuf
    ];

    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.gimp-with-plugins];
    };
  };
}
