{
  den.aspects.rust = {
    os = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        cargo
      ];
    };
  };
}
