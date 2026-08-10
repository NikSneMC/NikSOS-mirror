{
  inputs,
  lib,
  ...
}: let
  inherit (builtins) mapAttrs;
  inherit (lib) optionalAttrs;
in {
  den.hosts =
    import ./hosts.nix
    |> mapAttrs (
      _: hosts:
        hosts
        |> mapAttrs (
          _: host:
            host
            // optionalAttrs ((host.class or "") == "systemManager") {
              home-manager.module = inputs.home-manager.nixosModules.home-manager;
            }
        )
    );
}
