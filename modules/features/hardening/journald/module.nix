{
  den.aspects.hardened-journald = {
    os = {
      services = {
        logrotate.enable = true;

        journald = {
          storage = "persistent";
          upload.enable = false;

          settings.Journal = {
            SystemMaxUse = "500M";
            SystemMaxFileSize = "50M";
            RuntimeMaxUse = "100M";
            RuntimeMaxFileSize = "20M";
            MaxRetentionSec = "7day";
          };
        };
      };
    };
  };
}
