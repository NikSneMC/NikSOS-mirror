{
  den.aspects.ayugram = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.ayugram-desktop];
    };
  };
}
