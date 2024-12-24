{pkgs, ...}: let
  ides = with pkgs.custom.jetbrains; [
      idea-ultimate
      # pycharm-professional
      # webstorm
      # rust-rover
      # goland
      # phpstorm
      # clion
    ];
in {
  programs.jetbrains-remote = {
    enable = true;
    inherit ides;
  };
  home.packages = ides;
}
