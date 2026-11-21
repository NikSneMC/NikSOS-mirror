{lib, ...}: let
  inherit (builtins) mapAttrs split attrValues;
  inherit (lib) last fakeHash;

  mkPlugins = pkgs:
    mapAttrs (
      _: value:
        value
        |> mapAttrs (
          url: hash: let
            inherit (pkgs) fetchzip fetchurl;

            ext =
              url
              |> split "\\."
              |> last;

            args = {
              inherit url;

              hash =
                if hash == null
                then fakeHash
                else hash;
            };
          in
            if ext == "zip"
            then fetchzip args
            else if ext == "jar"
            then fetchurl (args // {executable = true;})
            else throw "unsupported plugin extension: ${ext}"
        )
        |> attrValues
    );

  mkIdes = pkgs: plugins': let
    inherit (pkgs) jetbrains;

    plugins = mkPlugins pkgs plugins';
  in
    map (
      ide:
        jetbrains.plugins.addPlugins pkgs.${ide}
        (plugins.common ++ (plugins.${ide} or []))
    );
in {
  inherit mkIdes;
}
