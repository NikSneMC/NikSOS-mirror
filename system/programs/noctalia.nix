{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.noctalia-greeter.nixosModules.default
  ];

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
}
