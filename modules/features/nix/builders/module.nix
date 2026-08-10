{
  den,
  lib,
  ...
}: let
  inherit (builtins) attrValues concatMap filter;
  inherit (lib) mkForce;

  inherit (import ./lib.nix {inherit lib;}) toBase64;

  peersOf = self:
    den.hosts
    |> attrValues
    |> concatMap attrValues
    |> filter (h: h.name != self.name);
in {
  den.aspects.builders = {host, ...}: let
    peers = peersOf host;
  in {
    os = {
      nix = {
        distributedBuilds = true;

        buildMachines =
          peers
          |> filter (h: h.builder.enable)
          |> map (h: {
            hostName = h.name;
            inherit (h.builder) systems maxJobs speedFactor supportedFeatures;
            protocol = "ssh-ng";
            sshUser = "builder";
            sshKey = "/etc/ssh/ssh_host_ed25519_key";
            publicHostKey = toBase64 "${h.hostKey}\n";
          });

        settings.max-jobs = mkForce 0;
      };
    };
  };
}
