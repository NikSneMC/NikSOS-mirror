{pkgs, ...}: {
  virtualisation.podman = {
    enable = true;
    autoPrune.enable = true;
  };

  environment.systemPackages = with pkgs; [
    podman-compose
    podman-desktop
  ];
}
