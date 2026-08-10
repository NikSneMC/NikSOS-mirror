{
  config,
  lib,
  ...
}: let
  inherit (lib) literalExpression mkDefault mkOption types;
in {
  options.theme = {
    flavor = mkOption {
      description = '''';
      type = types.str;
      example = literalExpression "latte";
      default = "mocha";
    };
    accent = mkOption {
      description = '''';
      type = types.str;
      example = literalExpression "blue";
      default = "mauve";
    };

    colors = mkOption {
      description = '''';
      type = types.attrs;
      readOnly = true;
      default = let
        inherit (builtins) substring readFile fromJSON mapAttrs;

        removeHash = substring 1 6;
        catppuccin =
          "${config.catppuccin.sources.palette}/palette.json"
          |> readFile
          |> fromJSON
          |> mapAttrs (
            _: flavor:
              (mapAttrs (_: color: removeHash color.hex) flavor.colors)
              // {
                accent = removeHash flavor.colors.${config.theme.accent}.hex;
              }
          );
      in
        catppuccin
        // catppuccin.${config.theme.flavor}
        // {
          notable =
            if config.theme.flavor == "latte"
            then catppuccin.mocha
            else catppuccin.latte;
        };
    };

    wallpaper = mkOption {
      description = ''
        Location of the wallpaper to use throughout the system.
      '';
      type = types.path;
      example = literalExpression "./wallpaper.png";
    };
  };

  config.catppuccin = {
    enable = true;
    autoEnable = true;
    cursors.enable = mkDefault false;
    inherit (config.theme) flavor accent;
  };
}
