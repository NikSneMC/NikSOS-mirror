{
  den.aspects.cargo-binstall = {
    os = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        cargo-binstall
      ];
    };
  };
}
