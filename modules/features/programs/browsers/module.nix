{den, ...}: {
  den.aspects.browsers = {
    includes = with den.aspects; [
      helium
      zen
    ];
  };
}
