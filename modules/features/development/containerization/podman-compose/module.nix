{
  den.aspects.podman-compose = {
    os = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        podman-compose
      ];
    };
  };
}
