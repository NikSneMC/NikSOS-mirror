{inputs, ...}: {
  flake-file.inputs = {
    catppuccin.url = "github:catppuccin/nix";
  };

  den.aspects.theme = {
    provides.system.os = {
      imports = [
        ./options.nix
        inputs.catppuccin.nixosModules.catppuccin
      ];

      catppuccin.cache.enable = true;
    };

    homeManager = {
      imports = [
        ./options.nix
        inputs.catppuccin.homeModules.catppuccin
      ];
    };
  };
}
