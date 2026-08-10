{
  den.aspects.gnumake = {
    os = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        gnumake
      ];
    };
  };
}
