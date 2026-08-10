{
  den.aspects.ddcutil = {
    os = {pkgs, ...}: {
      hardware.i2c.enable = true;

      environment.systemPackages = [pkgs.ddcutil];
    };
  };
}
