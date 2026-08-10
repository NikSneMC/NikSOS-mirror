{
  den.aspects.gcr = {
    os = {pkgs, ...}: {
      services.dbus.packages = [pkgs.gcr];
    };
  };
}
