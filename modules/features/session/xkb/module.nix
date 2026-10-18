{
  den.aspects.xkb = {
    os = {config, ...}: {
      console.useXkbConfig = true;

      services.xserver.xkb = {
        layout = "us";
        options = "compose:ralt";
      };

      environment.variables = {
        XKB_DEFAULT_LAYOUT = config.services.xserver.xkb.layout;
        XKB_DEFAULT_VARIANT = config.services.xserver.xkb.variant;
      };
    };
  };
}
