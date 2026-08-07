{pkgs, ...}: {
  imports = [
    ./development.nix
    ./fonts.nix
    ./gaming.nix
    ./noctalia.nix
    ./qt.nix
    ./xdg.nix
  ];

  programs = {
    dconf.enable = true;
    kdeconnect.enable = true;
    seahorse.enable = true;
    nix-ld.enable = true;
    gdk-pixbuf.modulePackages = [pkgs.librsvg];
    wireshark.enable = true;
  };

  environment.systemPackages = with pkgs; [
    ffmpeg-full
  ];
}
