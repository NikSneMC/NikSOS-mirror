{
  den.aspects.kubectl = {
    os = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        kubectl
      ];
    };
  };
}
