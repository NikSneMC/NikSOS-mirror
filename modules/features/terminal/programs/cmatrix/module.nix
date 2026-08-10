{
  den.aspects.cmatrix = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.cmatrix];
    };
  };
}
