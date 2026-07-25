{config, ...}: let
  historyFile = "${config.xdg.stateHome}/noctalia/recently_used.json";
in {
  programs.noctalia.settings.shell.launcher.dmenu.entry.run = {
    prefix = "run";
    label = "Execute a command";
    glyph = "terminal-2";

    freeform = true;
    global = false;

    command = ''
      jaq -r '
        .["dmenu.run"] // []
        | .[]
      ' ${historyFile}
    '';

    exec = ''sh -lc "{query}"'';
  };
}
