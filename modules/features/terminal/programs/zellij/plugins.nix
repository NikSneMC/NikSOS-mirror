args: let
  inherit (builtins) concatStringsSep filter;

  joinLines = concatStringsSep "\n";

  plugins =
    [
      ./plugins/zellij-forgot.nix
      ./plugins/zjstatus.nix
      ./plugins/zsm.nix
    ]
    |> map (file: import file args);

  configs =
    plugins
    |> map (plugin: plugin.config)
    |> joinLines;

  toLoad =
    plugins
    |> filter (plugin: plugin.load)
    |> map (plugin: plugin.name)
    |> joinLines;
in
  # kdl
  ''
    plugins {
      ${configs}
    }

    load_plugins {
      ${toLoad}
    }
  ''
