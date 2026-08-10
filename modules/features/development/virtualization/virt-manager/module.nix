{
  den.aspects.virt-manager = {
    provides.to-users.user.extraGroups = ["libvirtd"];

    os = {
      virtualisation.libvirtd.enable = true;
      programs.virt-manager.enable = true;
    };
  };
}
