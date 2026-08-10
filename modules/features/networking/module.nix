{den, ...}: {
  den.aspects.networking = {
    includes = with den.aspects; [
      amnezia
      network-manager
    ];
  };
}
