{
  den.aspects.gdk-pixbuf = {
    os = {pkgs, ...}: {
      programs.gdk-pixbuf.modulePackages = [pkgs.librsvg];
    };
  };
}
