{
  den.aspects.minecraft = {
    os = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        libGL
        glfw3-minecraft
      ];
    };

    homeManager = {pkgs, ...}: {
      home.packages = with pkgs; [
        (prismlauncher.override {
          jdks = [
            zulu8
            zulu11
            zulu17
            zulu21
            zulu25
          ];
        })
      ];
    };
  };
}
