{lib, ...}: let
  inherit (lib) mkOption types;
in {
  options.helix.grammars = mkOption {
    type = types.either (types.enum ["all"]) (types.listOf types.str);
    default = "all";
    example = ["bash" "nix" "toml"];
  };
}
