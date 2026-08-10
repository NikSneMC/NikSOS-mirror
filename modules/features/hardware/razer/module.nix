{
  den.aspects.razer = {host, ...}: {
    os = let
      inherit (builtins) attrNames;
    in {
      hardware.openrazer = {
        enable = true;
        users = attrNames host.users;
      };
    };
  };
}
