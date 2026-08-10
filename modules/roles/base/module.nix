{den, ...}: {
  den.aspects.base = {
    includes = with den.aspects; [
      fish
      hosts-file
      nix
      rio-terminfo
      secrets
      theme
    ];
  };
}
