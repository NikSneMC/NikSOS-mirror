{
  inputs,
  lib,
  ...
}: let
  inherit (builtins) mapAttrs attrValues;
  inherit (lib) filterAttrs hasPrefix removePrefix;

  prefix = "noctalia-plugins-";
in {
  programs.noctalia.settings.plugins = {
    enabled = [
      "noctalia/bongocat"
      "noctalia/translator"
      "noctalia/kaomoji"
    ];

    source =
      inputs
      |> filterAttrs (name: _: hasPrefix prefix name)
      |> mapAttrs (_: toString)
      |> mapAttrs (_: removePrefix prefix)
      |> mapAttrs (name: location: {
        enabled = true;
        inherit name location;
        kind = "path";
        auto_update = false;
      })
      |> attrValues;
  };
}
