{den, ...}: {
  den.aspects.kubernetes = {
    includes = with den.aspects; [
      helm
      kind
      kubectl
    ];
  };
}
