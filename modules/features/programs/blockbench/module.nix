{
  den.aspects.blockbench = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.blockbench];
    };
  };
}
