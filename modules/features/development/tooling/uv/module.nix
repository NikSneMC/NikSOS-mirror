{
  den.aspects.uv = {
    os = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        uv
      ];
    };
  };
}
