{
  den.aspects.file-roller = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.file-roller];
    };
  };
}
