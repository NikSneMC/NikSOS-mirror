{
  den.aspects.wlr-randr = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.wlr-randr];
    };
  };
}
