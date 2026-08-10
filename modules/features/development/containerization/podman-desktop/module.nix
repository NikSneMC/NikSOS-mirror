{
  den.aspects.podman-desktop = {
    os = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        podman-desktop
      ];
    };
  };
}
