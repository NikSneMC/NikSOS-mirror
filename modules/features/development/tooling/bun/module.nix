{
  den.aspects.bun = {
    os = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        bun
      ];
    };
  };
}
