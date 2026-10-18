{inputs, ...}: {
  flake-file.inputs = {
    niri = {
      url = "github:NikSneMC/niri-flake/usable";
      inputs = {
        nixpkgs-stable.follows = "";
        niri-stable.follows = "";
        xwayland-satellite-stable.follows = "";
      };
    };

    niri-autoselect-portal = {
      url = "git+https://codeberg.org/debugloop/niri-autoselect-portal.git";
      inputs.pre-commit-hooks.follows = "git-hooks";
    };
  };

  den.aspects.niri = {
    os = {
      config,
      inputs',
      pkgs,
      ...
    }: {
      imports = [
        inputs.niri.nixosModules.niri
        inputs.niri-autoselect-portal.nixosModules.default
      ];

      niksos.caches."niri-epireyn.cachix.org" = "niri-epireyn.cachix.org-1:tlVyFN7CtsDT+ZcLPS+ekFWeT1X6X4OqvWqbBMyIzFA=";

      programs.niri = {
        enable = true;
        package = inputs'.niri.packages.niri-unstable;
      };

      environment.systemPackages = [
        inputs'.niri.packages.xwayland-satellite-unstable
      ];

      services.niri-autoselect-portal.enable = true;

      xdg.portal = {
        config.niri.default = ["gtk" "gnome"];

        extraPortals = with pkgs; [
          xdg-desktop-portal-gnome
          xdg-desktop-portal-gtk
        ];

        configPackages = [
          config.programs.niri.package
        ];
      };
    };

    homeManager = {
      imports = [
        ./home.nix
        ./binds.nix
        ./input.nix
        ./layout.nix
        ./rules.nix
      ];
    };
  };
}
