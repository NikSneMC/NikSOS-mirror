{
  assets,
  den,
  lib,
  ...
}: let
  inherit (lib) mkForce;

  inherit (import ../lib.nix {inherit lib;}) mkHostProvides;
in {
  den.aspects.niksne = {
    includes = [
      den.batteries.primary-user
      (den.batteries.user-shell "fish")

      den.batteries.host-aspects

      den.aspects.terminal-core

      ({user, ...}: {
        os.users.users.${user.userName}.initialHashedPassword =
          mkForce "$y$j9T$e8bsh.I1FTPxmNYEkaKX40$NOuq1SBtz3ypBTjF4vSFIF4hFzXzBOgUsmGS1whMCX2";
      })
    ];

    provides = mkHostProvides ./.;

    homeManager = {
      theme = {
        flavor = "mocha";
        accent = "blue";

        wallpaper = "${assets}/wallpapers/night_forest.png";
      };
    };

    user = {
      description = "NikSne";
      extraGroups = [
        "input"
        "video"
        "dialout"
        "i2c"
        "wireshark"
      ];
    };
  };
}
