{den, ...}: {
  den.aspects.filebrowser = {
    includes = with den.aspects; [
      acme
      nginx
    ];

    os = {config, ...}: {
      services.filebrowser = {
        enable = true;
        settings = {
          address = "127.0.0.1";
          port = 8083;
        };
      };

      networking.firewall.interfaces.amn0.allowedTCPPorts = [443];

      services.nginx.virtualHosts."files.${config.networking.hostName}.niksne.ru" = {
        forceSSL = true;
        enableACME = true;

        locations."/" = {
          proxyPass = "http://127.0.0.1:8083";
          proxyWebsockets = true;
        };
      };
    };
  };
}
