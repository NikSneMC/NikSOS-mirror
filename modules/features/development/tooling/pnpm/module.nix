{
  den.aspects.pnpm = {
    os = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        pnpm
      ];
    };
  };
}
