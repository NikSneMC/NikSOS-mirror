{
  den.aspects.surrealist = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.surrealist];
    };
  };
}
