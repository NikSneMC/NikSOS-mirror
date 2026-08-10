{lib, ...}: let
  inherit (lib) mkOption types;
in {
  den.schema = {
    host = {
      options = {
        role = mkOption {
          type = types.enum [
            "workstation"
            "server"
            "gateway"
          ];
          default = "workstation";
        };

        addrs = {
          lan = mkOption {
            type = types.attrsOf types.str;
            default = {};
            example = {
              ethernet0 = "192.168.1.10";
              ethernet1 = "192.168.1.11";
            };
          };

          public = mkOption {
            type = types.attrsOf types.str;
            default = {};
            example = {
              ipv4 = "203.0.113.7";
              ipv6 = "2001:db8::7";
            };
          };

          vpn = mkOption {
            type = types.nullOr types.str;
            default = null;
          };
        };

        hostKey = mkOption {
          type = types.nullOr types.str;
          default = null;
        };

        builder = {
          enable = mkOption {
            type = types.bool;
            default = false;
          };

          maxJobs = mkOption {
            type = types.int;
            default = 1;
          };

          speedFactor = mkOption {
            type = types.int;
            default = 1;
          };

          systems = mkOption {
            type = types.listOf types.str;
            default = [];
          };

          supportedFeatures = mkOption {
            type = types.listOf types.str;
            default = [];
          };
        };
      };
    };

    user = {
      options = {
        email = mkOption {
          type = types.nullOr types.str;
          default = null;
        };

        sshKeys = mkOption {
          type = types.listOf types.str;
          default = [];
          example = ["ssh-ed25519 AAAAC3Nza... niksne@konran"];
        };
      };
    };
  };
}
