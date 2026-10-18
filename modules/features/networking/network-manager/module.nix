{
  den.aspects.network-manager = {
    os = {
      networking.networkmanager = {
        enable = true;
        dns = "systemd-resolved";
      };

      services.resolved.enable = true;
    };

    provides = {
      no-wait-online.os = {
        systemd.services.NetworkManager-wait-online.enable = false;
      };
    };
  };
}
