{den, ...}: {
  den.aspects.terminal-core = {
    includes = with den.aspects; [
      atuin
      bat
      btop
      duf
      dust
      eza
      fd
      file
      fish
      git
      helix
      jaq
      ripgrep
      shell-env
      ssh
      starship
      tree
      zellij
      zoxide
    ];
  };
}
