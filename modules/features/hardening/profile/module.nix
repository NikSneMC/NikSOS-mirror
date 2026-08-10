{
  den.aspects.hardened-profile = {
    os = {modulesPath, ...}: {
      imports = ["${modulesPath}/profiles/hardened.nix"];
    };
  };
}
