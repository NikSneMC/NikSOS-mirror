{
  den.aspects.chatterino = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.chatterino2];
    };
  };
}
