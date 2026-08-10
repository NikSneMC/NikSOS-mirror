{
  den.aspects.helm = {
    os = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        kubernetes-helm
      ];
    };
  };
}
