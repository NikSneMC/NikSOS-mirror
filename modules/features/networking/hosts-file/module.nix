{
  den.aspects.hosts-file = {
    os = {
      config,
      lib,
      ...
    }: let
      inherit (builtins) attrValues filter listToAttrs;
      inherit (lib) concatLines concatStrings findFirst nameValuePair optional optionals;

      registry = import ../../../den/lib.nix;

      self = findFirst (h: h.name == config.networking.hostName) null registry.hosts;
      onLan = self != null && (self.addrs.lan or {}) != {};

      addressesFor = peer:
        optionals onLan (attrValues (peer.addrs.lan or {}))
        ++ optional ((peer.addrs.vpn or null) != null) peer.addrs.vpn
        ++ attrValues (peer.addrs.public or {});

      lineFor = peer:
        addressesFor peer
        |> map (addr: "${addr} ${peer.name}")
        |> concatLines;
    in {
      networking.extraHosts =
        registry.hosts
        |> filter (peer: peer.name != config.networking.hostName)
        |> map lineFor
        |> concatStrings;

      programs.ssh.knownHosts =
        registry.hosts
        |> filter (peer: (peer.hostKey or null) != null)
        |> map (peer:
          nameValuePair peer.name {
            hostNames = [peer.name] ++ addressesFor peer;
            publicKey = peer.hostKey;
          })
        |> listToAttrs;
    };
  };
}
