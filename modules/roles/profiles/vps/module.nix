{den, ...}: {
  den.aspects.vps = {
    includes = with den.aspects; [
      minimal
    ];

    os = {
      zramSwap.enable = true;

      services.qemuGuest.enable = true;
    };
  };
}
