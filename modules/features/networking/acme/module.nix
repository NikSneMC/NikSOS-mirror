{
  den.aspects.acme = {
    os = {config, ...}: {
      age.secrets.cloudflare-dns.file = ../../../../secrets/cloudflare-dns.age;

      security.acme = {
        acceptTerms = true;

        defaults = {
          email = "acme@niksne.ru";
          dnsProvider = "cloudflare";
          dnsResolver = "1.1.1.1:53";
          environmentFile = config.age.secrets.cloudflare-dns.path;
        };
      };
    };
  };
}
