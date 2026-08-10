{
  den.aspects.pipes-rs = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.pipes-rs];
    };
  };
}
