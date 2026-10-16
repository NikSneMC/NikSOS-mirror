{lib, ...}: let
  inherit (builtins) mapAttrs attrValues genList;
  inherit (lib) optionalAttrs mergeAttrsList take mod;
  inherit (lib.lists) findFirstIndex;

  mkBinds = includeOptionals: binds:
    binds
    |> mapAttrs (
      _: {
        desc,
        action,
        allow-when-locked ? false,
        repeat ? false,
        cooldown-ms ? null,
      }:
        {
          inherit action;
        }
        // (
          optionalAttrs includeOptionals {
            hotkey-overlay.title = desc;
            inherit allow-when-locked repeat cooldown-ms;
          }
        )
    );

  mkWorkspacesBinds = config: let
    workspaces =
      config.programs.niri.settings.workspaces
      |> attrValues
      |> map (ws: ws.name)
      |> take 10;
  in
    workspaces
    |> map (
      name: let
        nameIndex = findFirstIndex (w: w == name) null workspaces;
        wsIndex = mod (nameIndex + 1) 10;
        ws = toString wsIndex;
      in {
        "Mod+${ws}" = {
          desc = "Focus the `${name}` workspace";
          action.focus-workspace = name;
        };
        "Mod+Shift+${ws}" = {
          desc = "Move the focused window to the `${name}` workspace";
          action.move-window-to-workspace = name;
        };
        "Mod+Shift+Ctrl+Alt+${ws}" = {
          desc = "Move the focused column to the `${name}` workspace";
          action.move-column-to-workspace = name;
        };
      }
    )
    |> mergeAttrsList;

  mkColumnsBinds = n:
    n
    |> genList (
      x: let
        m = x + 1;
        ws = toString (mod m 10);
        mStr = toString m;
      in {
        "Mod+Alt+${ws}" = {
          desc = "Focus a column at index ${mStr}";
          action.focus-column = m;
        };
        "Mod+Alt+Shift+${ws}" = {
          desc = "Move column to the index ${mStr}";
          action.move-column-to-index = m;
        };
      }
    )
    |> mergeAttrsList;
in {
  inherit mkBinds mkWorkspacesBinds mkColumnsBinds;
}
