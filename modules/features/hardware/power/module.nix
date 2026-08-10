{
  den.aspects.power = {
    os = {
      services = {
        logind.settings.Login.HandlePowerKey = "suspend";

        # fix pipewire #2669 and #4115
        pipewire.wireplumber.extraConfig."wireplumber.profiles".main."monitor.libcamera" = "disabled";
      };
    };
  };
}
