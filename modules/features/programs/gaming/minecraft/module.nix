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
            temurin-bin-8
            graalvmPackages.graalvm-oracle_17
            temurin-bin-21
            graalvmPackages.graalvm-oracle_25
          ];
        })
      ];
    };
  };
}
