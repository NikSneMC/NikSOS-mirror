{
  networking = {
    wireguard.interfaces.wg-mc = {
      ips = ["10.100.0.1/24"];
      listenPort = 51820;

      privateKeyFile = "/etc/wireguard/private.key";

      peers = [
        {
          publicKey = "AHNCoXQ5EGZV7vdtFhxqOusOScJ+eAepptz1GfbO1Hg=";
          allowedIPs = ["10.100.0.2/32"];
        }
      ];
    };

    firewall = {
      allowedUDPPorts = [
        51820
        24454
      ];

      allowedTCPPorts = [
        25565
      ];
    };
  };
}
