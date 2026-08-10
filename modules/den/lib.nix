let
  inherit (builtins) attrNames concatMap filter;

  bySystem = import ./hosts.nix;

  hosts =
    bySystem
    |> attrNames
    |> concatMap (
      system:
        bySystem.${system}
        |> attrNames
        |> map (name: bySystem.${system}.${name} // {inherit name;})
    );

  usersOf = host:
    host.users
    or {}
    |> attrNames
    |> map (name: host.users.${name} // {inherit name;});

  hostKeysOf = hs: filter (k: k != null) (map (h: h.hostKey or null) hs);

  keysOfUser = userName:
    hosts
    |> concatMap usersOf
    |> filter (u: u.name == userName)
    |> concatMap (u: u.sshKeys or []);

  userKeysOf = hs:
    hs
    |> concatMap usersOf
    |> concatMap (u: u.sshKeys or []);
in {
  inherit hosts usersOf hostKeysOf userKeysOf keysOfUser;
}
