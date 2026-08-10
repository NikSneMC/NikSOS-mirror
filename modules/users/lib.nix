{lib, ...}: let
  inherit (builtins) mapAttrs pathExists readDir;
  inherit (lib) filterAttrs;

  mkHostProvides = dir:
    dir
    |> readDir
    |> filterAttrs (
      name: type:
        type
        == "directory"
        && pathExists (dir + "/${name}/host.nix")
    )
    |> mapAttrs (
      name: _: {
        homeManager.imports = [(dir + "/${name}/host.nix")];
      }
    );
in {
  inherit mkHostProvides;
}
