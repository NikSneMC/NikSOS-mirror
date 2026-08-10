{den, ...}: {
  den.aspects.hardening = {
    includes = with den.aspects; [
      auditd
      hardened-journald
      hardened-kernel
      hardened-profile
      hardened-sudo
    ];
  };
}
