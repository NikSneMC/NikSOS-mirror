{inputs, ...}: {
  den.aspects.accounts = {host, ...}: {
    os = let
      inherit (builtins) attrNames concatMap;
    in {
      services.accounts-daemon.enable = true;

      systemd.tmpfiles.rules =
        host.users
        |> attrNames
        |> concatMap (username: [
          "f+ /var/lib/AccountsService/users/${username}  0600 root root - [User]\\nIcon=/var/lib/AccountsService/icons/${username}\\n"
          "L+ /var/lib/AccountsService/icons/${username}  - - - - ${inputs.assets}/users/${username}.png"
        ]);
    };
  };
}
