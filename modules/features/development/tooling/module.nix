{den, ...}: {
  den.aspects.development = {
    includes = with den.aspects; [
      bun
      cargo
      cargo-binstall
      direnv
      gcc
      gnumake
      java
      nodejs
      pnpm
      python
      rust
      uv
    ];
  };
}
