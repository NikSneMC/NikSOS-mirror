_: let
  inherit (builtins) isString listToAttrs;

  mkEnabledPluginsFromList = plugins:
    plugins
    |> map (
      plugin: let
        value = {enabled = true;};
      in
        if isString plugin
        then {
          name = plugin;
          inherit value;
        }
        else {
          inherit (plugin) name;
          value = (removeAttrs plugin ["name"]) // value;
        }
    )
    |> listToAttrs;
in {
  inherit mkEnabledPluginsFromList;
}
