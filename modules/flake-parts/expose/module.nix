{
  inputs,
  lib,
  ...
}: let
  inherit (builtins) baseNameOf attrNames length elemAt;
  inherit (lib) concatMap filterAttrs groupBy hasSuffix mapAttrs removeSuffix;
  inherit (lib.filesystem) listFilesRecursive;

  roots = [../../features ../../roles];

  moduleFiles =
    roots
    |> concatMap listFilesRecursive
    |> lib.filter (file: hasSuffix "/module.nix" (toString file));

  nameOf = file: baseNameOf (removeSuffix "/module.nix" (toString file));

  grouped = groupBy nameOf moduleFiles;

  duplicates = grouped |> filterAttrs (_: files: length files > 1);
in
  if duplicates != {}
  then throw "flake-parts/expose: duplicate feature names, rename one of: ${toString (attrNames duplicates)}"
  else {
    flake.flakeModules =
      {default = (inputs.import-tree.match ".*/module\\.nix") ../../.;}
      // (grouped |> mapAttrs (_: files: elemAt files 0));
  }
