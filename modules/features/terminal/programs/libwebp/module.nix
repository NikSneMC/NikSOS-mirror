{
  den.aspects.libwebp = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.libwebp];
    };
  };
}
