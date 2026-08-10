{den, ...}: {
  den.aspects.media = {
    includes = with den.aspects; [
      amberol
      celluloid
      gimp
      imagemagick
      loupe
      mpv
      pamixer
      pavucontrol
      pulsemixer
      spicetify
    ];
  };
}
