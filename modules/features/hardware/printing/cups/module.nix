{
  den.aspects.cups = {
    os = {pkgs, ...}: {
      hardware.sane.enable = true;

      services.printing = {
        enable = true;
        drivers = with pkgs; [
          hplipWithPlugin
          samsung-unified-linux-driver
          epson-escpr
          canon-cups-ufr2
        ];
      };
    };
  };
}
