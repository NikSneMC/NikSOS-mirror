{
  config,
  lib',
  ...
}:
lib'.zellij.zellijPlugin {
  name = "zsm";
  url = "https://github.com/liam-mackie/zsm/releases/download/v0.5.0/zsm.wasm";
  sha256 = "sha256-/hiruKlSsR7Ya7UsTAxjP5wpLjxHkNgugqHmZpxmp+k=";
  config =
    # kdl
    ''
      default_layout "custom"

      session_separator "_"

      show_resurrectable_sessions true

      base_paths "${config.home.homeDirectory}/Projects"
    '';
}
