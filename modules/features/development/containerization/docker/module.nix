{
  den.aspects.docker = {
    provides.to-users.user.extraGroups = ["docker"];

    os = {
      virtualisation.docker = {
        enable = true;
        storageDriver = "btrfs";

        autoPrune.enable = true;
        daemon.settings.live-restore = false;
      };
    };
  };
}
