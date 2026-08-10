{
  den.aspects.virtualbox = {
    provides.to-users.user.extraGroups = ["vboxusers"];

    os.virtualisation.virtualbox.host = {
      enable = true;
      enableExtensionPack = true;
    };
  };
}
