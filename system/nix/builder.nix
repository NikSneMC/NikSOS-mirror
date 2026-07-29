{pkgs, ...}: let
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
        [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHxsrqXzsiLa0mlMD1t0YggugeSKBh3FrU7D1+31na1H root@nakama"
        ]
        |> map (key: ''${sshOpts} ${key}'');
    };
  };
}
