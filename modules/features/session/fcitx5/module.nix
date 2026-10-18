{lib, ...}: let
  inherit (builtins) head concatLists;
  inherit (lib) imap0 concat removePrefix mergeAttrsList;

  mkInputMethod = groups:
    groups
    |> imap0 (ig: group: let
      g = toString ig;
      DefaultIM = head group;
    in
      group
      |> imap0 (
        i: item: {
          "Groups/${g}/Items/${toString i}" = {
            Name = item.name or item;
            Layout = item.layout or "";
          };
        }
      )
      |> concat [
        {
          "Groups/${g}" = {
            Name =
              if ig == 0
              then "Default"
              else "Group-${g}";
            "Default Layout" = removePrefix "keyboard-" DefaultIM;
            inherit DefaultIM;
          };
        }
      ])
    |> concatLists
    |> mergeAttrsList;
in {
  den.aspects.fcitx5 = {
    homeManager = {pkgs, ...}: {
      i18n.inputMethod = {
        enable = true;
        type = "fcitx5";
        fcitx5 = {
          waylandFrontend = true;
          addons = with pkgs; [
            fcitx5-mozc-ut
          ];

          settings = {
            inputMethod = mkInputMethod [
              [
                "keyboard-us"
                "keyboard-ru"
                "mozc"
              ]
            ];
            globalOptions = {
              "Hotkey/TriggerKeys"."0" = "Super+space";
              "Hotkey/ActivateKeys" = {};
              "Hotkey/DeactivateKeys" = {};

              Behavior = {
                ActiveByDefault = true;
                ShowInputMethodInformation = false;
                CompactInputMethodInformation = false;
                OverrideXkbOption = true;
                AllowInputMethodForPassword = true;
              };
            };

            addons = {
              classicui.globalSection."Vertical Candidate List" = true;
              mozc.globalSection.PreeditCursorPositionAtBeginning = true;
            };
          };
        };
      };
    };
  };
}
