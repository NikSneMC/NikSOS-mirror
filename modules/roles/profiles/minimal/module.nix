{
  den.aspects.minimal = {
    os = {modulesPath, ...}: {
      imports = ["${modulesPath}/profiles/minimal.nix"];
    };
  };
}
