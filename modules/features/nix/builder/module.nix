{den, ...}: let
  inherit (builtins) attrValues concatMap filter;

  peersOf = self:
    den.hosts
    |> attrValues
    |> concatMap attrValues
    |> filter (h: h.name != self.name && h.hostKey != null);
in {
  den.aspects.builder = {host, ...}: {
    includes = with den.aspects; [
      openssh-hardened
    ];

    os = {pkgs, ...}: let
      inherit (builtins) concatStringsSep;

      sshOpts = concatStringsSep "," [
        "command=\"nix-daemon --stdio\""
        "no-agent-forwarding"
        "no-port-forwarding"
        "no-pty"
        "no-user-rc"
        "no-X11-forwarding"
      ];
    in {
      users = {
        groups.builder = {};
        users.builder = {
          shell = pkgs.bash;
          isSystemUser = true;
          createHome = true;
          group = "builder";
          home = "/var/empty";
          openssh.authorizedKeys.keys =
            peersOf host
            |> map (h: ''${sshOpts} ${h.hostKey}'');
        };
      };
    };
  };
}
