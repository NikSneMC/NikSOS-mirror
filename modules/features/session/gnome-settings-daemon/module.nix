{
  den.aspects.gnome-settings-daemon = {
    os = {pkgs, ...}: {
      services.dbus.packages = [pkgs.gnome-settings-daemon];
    };
  };
}
