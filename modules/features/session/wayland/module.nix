{den, ...}: {
  den.aspects.wayland-session = {
    includes = with den.aspects; [
      cliphist
      hyprpicker
      nwg-displays
      wayland-env
      wl-clip-persist
      wl-clipboard
      wl-mirror
      wl-screenrec
      wlr-randr
      wtype
    ];
  };
}
