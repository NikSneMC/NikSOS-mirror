{
  den.aspects.wf-recorder = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.wf-recorder];
    };
  };
}
