{inputs, ...}: let
  inherit (builtins) elem mapAttrs;
in {
  den.aspects.nix-registry = {
    os = {
      config,
      lib,
      ...
    }: let
      inherit (lib) filterAttrs isType mapAttrs' mapAttrsToList;
    in {
      environment.etc = let
        commonPaths = ["home-manager" "nixpkgs"];
      in
        config.nix.registry
        |> (filterAttrs (name: _: (elem name commonPaths)))
        |> (mapAttrs' (name: value: {
          name = "nix/path/${name}";
          value.source = value.flake;
        }));

      nix = let
        mappedRegistry =
          inputs
          |> (filterAttrs (_: isType "flake"))
          |> (mapAttrs (_: flake: {inherit flake;}))
          |> (flakes: flakes // {nixpkgs.flake = inputs.nixpkgs;});
      in {
        registry = mappedRegistry // {default-flake = mappedRegistry.nixpkgs;};

        nixPath = mapAttrsToList (key: _: "${key}=flake:${key}") config.nix.registry;
      };
    };
  };
}
