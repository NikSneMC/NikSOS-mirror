{
  den.aspects.gcc = {
    os = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        gcc
      ];
    };
  };
}
