{
  den.aspects.hardened-journald = {
    os = {
      users.groups.netdev = {};

      services = {
        logrotate.enable = true;
        journald = {
          storage = "volatile";
          upload.enable = false;
          extraConfig = ''
            SystemMaxUse=500M
            SystemMaxFileSize=50M
          '';
        };
      };
    };
  };
}
