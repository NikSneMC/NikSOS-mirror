{
  den,
  config,
  inputs,
  lib,
  ...
}: let
  inherit (lib) optional optionalAttrs;

  homeEnv = den.lib.home-env.makeHomeEnv {
    className = "homeManager";
    ctxName = "hm-system-manager";
    optionPath = "home-manager";

    supportedOses = ["systemManager"];

    getModule = _: inputs.home-manager.nixosModules.home-manager;

    forwardPathFn = {user, ...}: [
      "home-manager"
      "users"
      user.userName
    ];

    schemaIncludes = config.den.schema.hm-host.includes or [];
  };
in {
  flake-file.inputs = {
    system-manager = {
      url = "github:numtide/system-manager";
      inputs = {
        flake-compat.follows = "flake-compat";
        userborn.inputs = {
          systems.follows = "systems";
          flake-parts.follows = "flake-parts";
          pre-commit-hooks-nix.follows = "git-hooks";
        };
      };
    };
  };

  den = {
    aspects.system-manager-cache.os.niksos.caches."cache.numtide.com" = "niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g=";

    classes.systemManager.description = "system-manager configuration";

    schema = {
      host.includes = [homeEnv.battery];
      user.includes = [homeEnv.userDetect];
    };

    policies.os-to-system-manager = {host, ...}:
      optional (host ? class && host.class == "systemManager") (
        den.lib.policy.route {
          fromClass = "os";
          intoClass = "systemManager";
          path = [];
        }
      );

    default.includes = [
      den.policies.os-to-system-manager

      ({host, ...}:
        optionalAttrs (host ? class && host.class == "systemManager") {
          systemManager.nixpkgs.hostPlatform = host.system;
        })
    ];
  };
}
