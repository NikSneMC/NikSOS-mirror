{...}: let
  inherit (builtins) fetchurl;

  zellijPlugin = {
    url,
    name,
    sha256,
    config ? "",
    load ? false,
  }: let
    package = fetchurl {
      inherit url sha256;
      name = "zellij-plugin-${name}";
    };
  in {
    inherit name load;

    config =
      # kdl
      ''
        ${name} location="file://${package}" {
          ${config}
        }
      '';
  };
in {
  inherit zellijPlugin;
}
