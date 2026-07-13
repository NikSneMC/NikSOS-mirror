{
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";

    autoPrune.enable = true;
    daemon.settings.live-restore = false;
  };

  users.users.niksne.extraGroups = ["docker"];
}
