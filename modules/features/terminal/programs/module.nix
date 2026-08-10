{den, ...}: {
  den.aspects.terminal = {
    includes = with den.aspects; [
      terminal-core

      ani-cli
      cargo
      cava
      cmatrix
      comma
      coreutils
      cpufetch
      fastfetch
      gh
      git-helper
      lazydocker
      libnotify
      libwebp
      nix-output-monitor
      nix-prefetch-github
      onefetch
      packwiz
      pipes-rs
      skim
      tokei
      translate-shell
      try-rs
      unrar
      unzip
      wf-recorder
      wget
      xdg-user-dirs
      yazi
      zip
    ];
  };
}
