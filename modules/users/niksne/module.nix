{
  den,
  inputs,
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
          mkForce "$y$j9T$C7kpj5D7upLZ5lRlKCqvH1$MNUMu/kieExCRq8e40ktuOy5mwcg57EDnvRA0Zr.wdB";
      })
    ];

    provides = mkHostProvides ./.;

    homeManager = {
      theme = {
        flavor = "mocha";
        accent = "blue";

        wallpaper = "${inputs.assets}/wallpapers/night_forest.png";
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
