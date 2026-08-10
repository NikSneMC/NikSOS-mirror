{
  den.aspects.jaq = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.jaq];
    };
  };
}
