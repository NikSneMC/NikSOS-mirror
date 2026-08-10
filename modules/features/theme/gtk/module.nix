{
  den.aspects.gtk = {
    homeManager = {
      config,
      pkgs,
      ...
    }: {
      gtk = {
        enable = true;

        font = {
          name = "JetBrainsMono Nerd Font Propo";
          package = pkgs.nerd-fonts.jetbrains-mono;
          size = 10;
        };

        theme = let
          inherit (config.theme) flavor accent;
        in {
          name = "catppuccin-${flavor}-${accent}-standard";
          package = pkgs.catppuccin-gtk.override {
            variant = flavor;
            accents = [accent];
          };
        };

        gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
        gtk4 = {inherit (config.gtk) theme;};

        iconTheme = {
          name = "Colloid-Teal-Dracula-Dark";
          package = pkgs.colloid-icon-theme.override {
            schemeVariants = ["dracula"];
            colorVariants = ["teal"];
          };
        };
      };

      catppuccin.gtk.icon.enable = false;
    };
  };
}
