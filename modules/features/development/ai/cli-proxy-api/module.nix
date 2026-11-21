{
  den.aspects.cli-proxy-api = {
    os = {config, ...}: {
      age.secrets = {
        cliproxyapi-api-key.file = ../../../../../secrets/cliproxyapi-api-key.age;
        cliproxyapi-management-key.file = ../../../../../secrets/cliproxyapi-management-key.age;
      };

      services.cliproxyapi = {
        enable = true;
        settings = {
          server = {
            host = "127.0.0.1";
            port = 8317;
          };
          access.api-keys = [{_secret = config.age.secrets.cliproxyapi-api-key.path;}];
          management = {
            allow-remote = false;
            secret-key._secret = config.age.secrets.cliproxyapi-management-key.path;
          };
          observability.logs.logging-to-file = true;
        };
      };
    };
  };
}
