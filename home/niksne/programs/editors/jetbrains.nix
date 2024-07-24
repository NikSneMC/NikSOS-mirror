{npkgs, ...}: let
  ides = with npkgs.jetbrains; [
    idea-ultimate
    pycharm-professional
    webstorm
    rust-rover
    goland
    phpstorm
    clion
  ];
in {
  programs.jetbrains-remote = {
    enable = true;
    inherit ides;
  };
  home.packages = (with npkgs.jetbrains; [
    # gateway
    writerside
  ]) ++ ides;
}
