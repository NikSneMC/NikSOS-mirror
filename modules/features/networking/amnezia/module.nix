{
  den.aspects.amnezia = {
    os = {pkgs, ...}: {
      # FIXME: https://github.com/amnezia-vpn/amneziawg-linux-kernel-module/issues/138
      # boot.extraModulePackages = with config.boot.kernelPackages; [
      #   amneziawg
      # ];

      environment.systemPackages = [pkgs.amneziawg-tools];

      programs.amnezia-vpn.enable = true;
    };
  };
}
