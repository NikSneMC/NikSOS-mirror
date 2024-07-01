{
  inputs,
  pkgs,
  ...
}: let
  ides = with pkgs.jetbrains; [
    idea-ultimate
    pycharm-professional
    webstorm
    rust-rover
    goland
    phpstorm
    # clion
  ];
in {
  programs.jetbrains-remote = {
    enable = true;
    inherit ides;
  };
  home.packages = (with pkgs.jetbrains; [
    # gateway
    writerside
  ]) ++ ides;
}
