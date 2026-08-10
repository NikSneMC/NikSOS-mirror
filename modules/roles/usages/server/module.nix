{den, ...}: {
  den.aspects.server = {
    includes = with den.aspects; [
      locale
      openssh-hardened
      security
    ];
  };
}
