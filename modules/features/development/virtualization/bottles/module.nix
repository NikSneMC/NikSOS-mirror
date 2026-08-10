{
  den.aspects.bottles = {
    os = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        bottles
      ];
    };
  };
}
