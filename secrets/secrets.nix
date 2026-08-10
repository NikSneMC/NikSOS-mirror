let
  inherit (builtins) filter elem;

  registry = import ../modules/den/lib.nix;

  inherit (registry) hosts hostKeysOf userKeysOf;

  recipients = names: let
    named = filter (h: elem h.name names) hosts;
  in
    hostKeysOf named ++ userKeysOf named;

  everyHost = hostKeysOf hosts ++ userKeysOf hosts;
in {
  "cloudflare-dns.age".publicKeys = recipients ["nakama"];

  _helpers = {inherit recipients everyHost;};
}
