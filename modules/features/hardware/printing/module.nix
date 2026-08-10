{den, ...}: {
  den.aspects.printing = {
    includes = with den.aspects; [
      avahi
      cups
      ipp-usb
    ];
  };
}
