{den, ...}: {
  den.aspects.catppuccin-tools = {
    includes = with den.aspects; [
      catppuccin-cli
      catwalk
      whiskers
    ];
  };
}
