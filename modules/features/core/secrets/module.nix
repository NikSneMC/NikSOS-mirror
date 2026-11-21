{inputs, ...}: {
  flake-file.inputs = {
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.secrets = {
    os = {
      imports = [inputs.agenix.nixosModules.age];

      age.identityPaths = ["/etc/ssh/ssh_host_ed25519_key"];
    };
  };
}
