{
  inputs,
  pkgs,
  ...
}: let
  tomlFormat = pkgs.formats.toml {};
in {
  home.packages = [inputs.try-rs.packages.${pkgs.stdenv.hostPlatform.system}.try-rs];

  xdg.configFile."try-rs/config.toml".source = tomlFormat.generate "try-rs-config" {
    tries_path = "~/Projects/local/playground";
    editor = "hx";
  };
}
