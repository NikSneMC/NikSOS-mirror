{
  flake = {
    niksosModules = {
      caches = import ./caches.nix;
      theme = import ./theme.nix;
    };
    homeManagerModules = {
      homes = import ./homes.nix;
      theme = import ./theme.nix;
    };
  };
}
