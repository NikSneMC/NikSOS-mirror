{inputs, ...}: {
  flake-file.inputs = {
    niri = {
      url = "github:sodiboo/niri-flake";
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
      pkgs,
      ...
    }: {
      imports = [
        inputs.niri.nixosModules.niri
        inputs.niri-autoselect-portal.nixosModules.default
      ];

      niksos.caches."niri.cachix.org" = "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964=";

      programs.niri = {
        enable = true;
        package = inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.niri-unstable;
      };

      environment.systemPackages = [
        inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.xwayland-satellite-unstable
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
