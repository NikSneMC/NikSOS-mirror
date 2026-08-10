{
  den.aspects.auditd = {
    os = {
      boot.kernelParams = ["audit=0"];

      security = {
        auditd.enable = false;
        audit.enable = false;
      };
    };
  };
}
