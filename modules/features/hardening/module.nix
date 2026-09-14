{den, ...}: {
  den.aspects.hardening = {
    includes = with den.aspects; [
      auditd
      hardened-journald
      hardened-kernel
      hardened-sudo
    ];

    os = {
      users.groups.netdev = {};
    };
  };
}
