{den, ...}: {
  den.aspects.laptop = {
    includes = with den.aspects; [
      bluetooth
      power
    ];
  };
}
