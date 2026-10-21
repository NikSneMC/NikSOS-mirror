{den, ...}: {
  den.aspects.networking = {
    includes = with den.aspects; [
      amnezia
      emudhra-fix
      network-manager
    ];
  };
}
