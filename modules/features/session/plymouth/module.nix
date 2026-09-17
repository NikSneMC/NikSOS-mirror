{assets, ...}: {
  den.aspects.plymouth = {
    os = {
      lib,
      pkgs,
      ...
    }: let
      variant = "mocha";
    in {
      boot.plymouth = {
        enable = true;
        theme = lib.mkDefault "catppuccin-${variant}";
        themePackages = lib.mkDefault [(pkgs.catppuccin-plymouth.override {inherit variant;})];
        logo = "${assets}/niksos/niksos100.png";
      };
    };
  };
}
