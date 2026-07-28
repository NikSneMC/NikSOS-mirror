{pkgs, ...}: {
  home.packages = [
    pkgs.factorio-space-age
  ];

  home.extraDependencies = [
    pkgs.factorio-space-age.src
  ];
}
