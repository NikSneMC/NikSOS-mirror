{
  inputs,
  lib,
  pkgs,
  ...
}: let
  inherit (builtins) mapAttrs attrValues;
  inherit (lib) filterAttrs hasPrefix removePrefix;

  prefix = "noctalia-plugins-";
in {
  home.packages = with pkgs; [
    fzf
  ];

  programs.noctalia.settings = {
    plugins = {
      auto_update = false;
      enabled = [
        "cleboost/anilist"
        "dotnetrob/cat"
        "noctalia/bongocat"
        "nightwatch75/file-search"
        "noctalia/kaomoji"
        "noctalia/notes"
        "thepunkoff/pomodoro"
        "radimous/prismlauncher-instances"
        "whyoolw/sharednd"
        "nightwatch75/todo"
        "noctalia/translator"
        "yocraft/web-launcher"
        "alexander/game-launcher"
      ];

      source =
        inputs
        |> filterAttrs (name: _: hasPrefix prefix name)
        |> mapAttrs (_: toString)
        |> mapAttrs (_: removePrefix prefix)
        |> mapAttrs (name: location: {
          enabled = true;
          inherit name location;
          kind = "path";
          auto_update = false;
        })
        |> attrValues;
    };

    plugin_settings = {
      "alexander/game-launcher" = {
        steampoacher_enabled = true;
      };
      "blackbartblues/audio-switcher" = {
        audio-switcher_placement = "floating";
        audio-switcher_position = "center";
      };
      "gustav0ar/drive-health" = {
        system_collector_enabled = true;
      };
      "nightwatch75/file-search" = {
        exclude_dirs = "node_modules, target";
        panel_open_near_click = false;
        panel_placement = "floating";
        panel_position = "center";
      };
      "nightwatch75/todo" = {
        panel_placement = "floating";
        panel_position = "center";
      };
      "noctalia/notes" = {
        panel_position = "center";
      };
      "oldirtty/color_picker" = {
        hyprpicker-cursor = true;
        hyprpicker-lowercase = true;
      };
      "thepunkoff/pomodoro" = {
        panel_placement = "floating";
        panel_position = "center";
      };
      "yocraft/web-launcher" = {
        icon_provider = "direct";
        links = [
          "GitHub|https://github.com"
          "Codeberg|https://codeberg.org"
          "YouTube|https://youtube.com"
          "Gmail|https://mail.google.com"
        ];
      };
    };
  };
}
