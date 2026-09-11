{config, ...}: let
  inherit (builtins) mapAttrs isString;
  inherit (config) theme;

  isDark = theme.flavor != "latte";

  dark =
    if isDark
    then theme.flavor
    else "mocha";
  light = "latte";

  custom_palette = "catppuccin-${dark}_${light}_${theme.accent}";

  colors =
    theme.colors
    |> mapAttrs (
      _: value: let
        hexify = hex: "#${hex}";
      in
        value
        |> (
          if isString value
          then hexify
          else mapAttrs (_: hexify)
        )
    );
in {
  programs.noctalia = {
    settings = {
      theme = {
        mode =
          if isDark
          then "dark"
          else "light";
        source = "custom";
        inherit custom_palette;
        templates = {
          enable_builtin_templates = false;
          enable_community_templates = false;
        };
      };
      wallpaper = {
        enabled = true;
        default.path = config.theme.wallpaper;
        directory = "${config.home.homeDirectory}/Pictures/Wallpapers";
        automation.enabled = false;
        edge_smoothness = 0.3;
        fill_color = colors.base;
        fill_mode = "crop";
        transition_on_startup = false;
      };
    };

    customPalettes.${custom_palette} = mapAttrs (
      _: palette:
        with colors.${palette}; {
          primary = accent;
          onPrimary = crust;
          secondary = peach;
          onSecondary = crust;
          tertiary = sapphire;
          onTertiary = crust;
          error = red;
          onError = crust;
          surface = base;
          onSurface = text;
          surfaceVariant = surface0;
          onSurfaceVariant = subtext1;
          outline = surface1;
          shadow = crust;
          hover = sky;
          onHover = crust;
          terminal = {
            foreground = text;
            background = crust;
            selectionFg = text;
            selectionBg = surface2;
            cursorText = base;
            cursor = rosewater;
            normal = {
              black = base;
              red = red;
              green = green;
              yellow = yellow;
              blue = blue;
              magenta = pink;
              cyan = teal;
              white = subtext1;
            };
            bright = {
              black = surface2;
              red = red;
              green = green;
              yellow = yellow;
              blue = blue;
              magenta = pink;
              cyan = teal;
              white = subtext0;
            };
          };
        }
    ) {inherit dark light;};
  };
}
