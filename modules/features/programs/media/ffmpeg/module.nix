{
  den.aspects.ffmpeg = {
    os = {pkgs, ...}: {
      environment.systemPackages = [pkgs.ffmpeg-full];
    };
  };
}
