{pkgs, ...}: {
  users.users = {
    niksne = {
      isNormalUser = true;
      initialHashedPassword = "$y$j9T$e8bsh.I1FTPxmNYEkaKX40$NOuq1SBtz3ypBTjF4vSFIF4hFzXzBOgUsmGS1whMCX2";
      description = "NikSne";
      shell = pkgs.fish;
      extraGroups = [
        "input"
        "networkmanager"
        "video"
        "wheel"
        "dialout"
        "i2c"
      ];
    };
  };
}
