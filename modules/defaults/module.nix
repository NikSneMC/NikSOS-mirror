{
  den,
  inputs,
  lib,
  ...
}: let
  inherit (builtins) attrValues any elem;
  inherit (lib) mkDefault optionalAttrs mapAttrsToList;

  registry = import ../den/lib.nix;
in {
  den = {
    schema.user.classes = mkDefault ["homeManager"];

    default = {
      includes = [
        den.batteries.define-user
        den.batteries.inputs'

        den.batteries.hostname

        den.aspects.base

        ({user, ...}: {
          os.users.users.${user.userName}.openssh.authorizedKeys.keys =
            registry.keysOfUser user.name;
        })

        ({host, ...}:
          optionalAttrs (host.users
            |> attrValues
            |> any (u: elem "homeManager" u.classes)) {
            os.home-manager = {
              extraSpecialArgs = {inherit inputs;};

              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
            };
          })

        ({host, ...}: {
          os.nixpkgs.overlays =
            {inherit (inputs) master unstable stable;}
            |> mapAttrsToList (
              name: input: _: _: {
                ${name} = import input {
                  inherit (host) system;
                  config.allowUnfree = true;
                };
              }
            );
        })
      ];

      homeManager = {osConfig, ...}: {
        home = {
          inherit (osConfig.system) stateVersion;
        };

        manual = {
          html.enable = false;
          json.enable = false;
          manpages.enable = false;
        };

        programs.home-manager.enable = true;
      };
    };
  };
}
