{
  pkgs,
  ...
}: {
  services.httpd = {
    enable = true;
    adminAddr = "contact@niksne.ru";
    virtualHosts = {
      "localhost" = {
        documentRoot = "/www/localhost";
      };
    };
  };
}