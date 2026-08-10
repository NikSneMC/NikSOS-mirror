{inputs, ...}: {
  flake-file.inputs = {
    noctalia.url = "github:noctalia-dev/noctalia/cachix";

    noctalia-plugins-official = {
      url = "github:noctalia-dev/official-plugins";
      flake = false;
    };

    noctalia-plugins-community = {
      url = "github:noctalia-dev/community-plugins";
      flake = false;
    };

    noctalia-greeter.url = "github:noctalia-dev/noctalia-greeter";
  };

  den.aspects.noctalia = {
    os = {
      config,
      pkgs,
      ...
    }: {
      imports = [inputs.noctalia-greeter.nixosModules.default];

      niksos.caches."noctalia.cachix.org" = "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=";

      programs.noctalia-greeter = {
        enable = true;
        package = inputs.noctalia-greeter.packages.${pkgs.stdenv.hostPlatform.system}.default;

        settings = {
          cursor.theme = let
            inherit (config.theme) flavor accent;
          in "catppuccin-${flavor}-${accent}-cursors";
          appearance = {
            password_style = "random";
            hide_logo = true;
          };
        };
      };
    };

    homeManager = {
      imports = [
        ./home.nix
        ./bar.nix
        ./launcher
        ./plugins.nix
        ./shell.nix
        ./theme.nix
      ];
    };
  };
}
