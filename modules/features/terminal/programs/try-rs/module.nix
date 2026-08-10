{
  flake-file.inputs = {
    try-rs = {
      url = "github:tassiovirginio/try-rs";
      inputs = {
        flake-utils.follows = "flake-utils";
        rust-overlay = {
          follows = "rust-overlay";
          inputs.nixpkgs.follows = "try-rs/nixpkgs";
        };
      };
    };
  };

  den.aspects.try-rs = {
    homeManager = {
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
    };
  };
}
