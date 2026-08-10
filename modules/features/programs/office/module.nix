{den, ...}: {
  den.aspects.office = {
    includes = with den.aspects; [
      libreoffice
      openscad
      simple-scan
      zathura
    ];
  };
}
