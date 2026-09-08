{
  den.aspects.nginx = {
    os = {
      services.nginx = {
        enable = true;

        recommendedTlsSettings = true;
        recommendedOptimisation = true;
        recommendedGzipSettings = true;
        recommendedProxySettings = true;

        virtualHosts."_" = {
          listen = [
            {
              addr = "0.0.0.0";
              port = 8888;
            }
          ];
          root = "/srv/www";
        };
      };
    };
  };
}
