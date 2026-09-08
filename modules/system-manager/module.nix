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

    aspects.system-manager-stubs = {host, ...}:
      lib.optionalAttrs (host ? class && host.class == "systemManager") {
        os = {lib, ...}: {
          options = {
            networking.extraHosts = lib.mkOption {
              type = lib.types.raw;
              default = {};
            };

            nix.daemonCPUSchedPolicy = lib.mkOption {
              type = lib.types.raw;
              default = {};
            };

            nix.daemonIOSchedClass = lib.mkOption {
              type = lib.types.raw;
              default = {};
            };

            nix.daemonIOSchedPriority = lib.mkOption {
              type = lib.types.raw;
              default = {};
            };

            programs.command-not-found = lib.mkOption {
              type = lib.types.raw;
              default = {};
            };

            programs.fish = lib.mkOption {
              type = lib.types.raw;
              default = {};
            };

            programs.less = lib.mkOption {
              type = lib.types.raw;
              default = {};
            };

            programs.nh = lib.mkOption {
              type = lib.types.raw;
              default = {};
            };

            programs.nix-index = lib.mkOption {
              type = lib.types.raw;
              default = {};
            };

            programs.nix-ld = lib.mkOption {
              type = lib.types.raw;
              default = {};
            };

            system.activationScripts.agenix = lib.mkOption {
              type = lib.types.raw;
              default = {};
            };

            system.activationScripts.agenixChown = lib.mkOption {
              type = lib.types.raw;
              default = {};
            };

            system.activationScripts.agenixInstall = lib.mkOption {
              type = lib.types.raw;
              default = {};
            };

            system.activationScripts.agenixNewGeneration = lib.mkOption {
              type = lib.types.raw;
              default = {};
            };

            documentation = lib.mkOption {
              type = lib.types.raw;
              default = {};
            };

            networking.hostName = lib.mkOption {
              type = lib.types.str;
              default = host.name;
            };
          };
        };
      };

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
      den.aspects.system-manager-stubs

      den.policies.os-to-system-manager

      ({host, ...}:
        optionalAttrs (host ? class && host.class == "systemManager") {
          systemManager.nixpkgs.hostPlatform = host.system;
        })
    ];
  };
}
