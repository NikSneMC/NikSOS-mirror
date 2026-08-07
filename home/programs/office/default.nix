{pkgs, ...}: {
  imports = [
    ./zathura.nix
  ];

  home.packages = with pkgs; [
    openscad
    libreoffice
    simple-scan
  ];
}
