{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./git
    ./zellij
    ./ani-cli.nix
    ./atuin.nix
    ./bat.nix
    ./cargo.nix
    ./comma.nix
    ./eza.nix
    ./fetchers.nix
    ./skim.nix
    ./ssh.nix
    ./try-rs.nix
    ./xdg.nix
    ./yazi.nix
    ./zoxide.nix
  ];

  home.packages = with pkgs; [
    # archives
    zip
    unzip
    unrar
    libwebp

    libnotify

    cmatrix
    pipes-rs

    dust
    uutils-coreutils-noprefix
    duf
    fd
    file
    jaq
    ripgrep
    nix-prefetch-github
    nix-output-monitor
    wf-recorder
    tree
    wget

    packwiz
    inputs.git-helper.packages.${stdenv.hostPlatform.system}.default
  ];

  programs = {
    btop.enable = true;
    cava.enable = true;
    lazydocker.enable = true;
    translate-shell.enable = true;
  };
}
