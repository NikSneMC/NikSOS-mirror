{
  den.aspects.fd = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.fd];
    };
  };
}
