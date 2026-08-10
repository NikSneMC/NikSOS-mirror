{
  den.aspects.gamescope = {
    os = {
      programs.gamescope = {
        enable = true;
        args = [
          "--rt"
          "--prefer-vk-device 8086:9bc4"
        ];
      };
    };
  };
}
