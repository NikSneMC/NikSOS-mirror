{
  den.aspects.kind = {
    os = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        kind
      ];
    };
  };
}
