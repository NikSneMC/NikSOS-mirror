{
  den.aspects.nodejs = {
    os = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        nodejs_24
      ];
    };
  };
}
