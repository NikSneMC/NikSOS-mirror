{
  den.aspects.nix-settings = {
    os = {
      config,
      lib,
      pkgs,
      ...
    }: let
      inherit (builtins) toJSON;
      inherit (lib) mkDefault;
    in {
      environment.systemPackages = [pkgs.git];

      nixpkgs.overlays = [
        (_: prev: {
          inherit (prev.lixPackageSets.stable) nixpkgs-review nix-eval-jobs nix-fast-build colmena;
        })
      ];

      nix = {
        package = pkgs.lixPackageSets.stable.lix;

        daemonCPUSchedPolicy = "idle";
        daemonIOSchedClass = "idle";
        daemonIOSchedPriority = 7;

        settings = {
          use-xdg-base-directories = true;

          use-registries = true;
          flake-registry = pkgs.writeText "flakes-empty.json" (toJSON {
            flakes = [];
            version = 2;
          });

          auto-optimise-store = true;
          builders-use-substitutes = true;

          experimental-features = [
            "nix-command"
            "flakes"
            "pipe-operator"
            "cgroups"
            "auto-allocate-uids"
          ];

          keep-derivations = true;
          keep-outputs = true;

          allowed-users = ["root" "@wheel" "builder"];

          trusted-users = ["root" "@wheel" "builder"];

          max-jobs = mkDefault "auto";

          sandbox = true;
          sandbox-fallback = false;

          system-features = ["nixos-test" "kvm" "recursive-nix" "big-parallel"];

          extra-platforms = config.boot.binfmt.emulatedSystems;

          keep-going = true;

          connect-timeout = 5;
          stalled-download-timeout = 20;

          log-lines = 30;

          pure-eval = false;

          warn-dirty = false;

          accept-flake-config = false;

          use-cgroups = pkgs.stdenv.isLinux;
        };
      };

      systemd.services.nix-gc = {
        unitConfig.ConditionACPower = true;
      };
    };
  };
}
