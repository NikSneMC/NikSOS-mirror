{lib, ...}: let
  inherit (lib) mkOption types;
in {
  options.programs.helix.grammars = mkOption {
    type = types.either (types.enum ["all"]) (types.listOf types.str);
    default = "all";
    example = ["bash" "nix" "toml"];
  };

  config = {
    programs.nhx = {
      enable = true;
      package = null;
    };
  };
}
