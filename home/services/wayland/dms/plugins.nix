{
  inputs,
  lib,
  ...
}: let
  inherit (builtins) listToAttrs;
  inherit (lib) nameValuePair;
in {
  imports = [inputs.dms-plugin-registry.homeModules.default];

  programs.dank-material-shell.plugins =
    [
      "alarmClock"
      "animeCalendar"
      "calculator"
      "catWidget"
      "commandRunner"
      "dankBatteryAlerts"
      "dankKDEConnect"
      "dankLauncherKeys"
      "dankNotepadModule"
      "dankPomodoroTimer"
      "dankTranslate"
      "emojiLauncher"
      "niriWindows"
      "usbManager"
      "webSearch"
    ]
    |> map (plugin: nameValuePair plugin {enable = true;})
    |> listToAttrs;
}
