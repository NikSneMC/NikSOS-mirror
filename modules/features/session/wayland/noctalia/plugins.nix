{
  inputs,
  lib,
  pkgs,
  ...
}: let
  inherit (builtins) mapAttrs attrValues;
  inherit (lib) filterAttrs hasPrefix removePrefix mapAttrsToList;
in {
  home.packages = with pkgs; [
    qrencode
    grim
    slurp
    tesseract
    speedtest-cli
  ];

  programs.noctalia.settings = {
    plugins = {
      auto_update = "none";
      enabled = [
        "cleboost/anilist"
        "dotnetrob/cat"
        "noctalia/bongocat"
        "nightwatch75/file-search"
        "noctalia/kaomoji"
        "noctalia/notes"
        "thepunkoff/pomodoro"
        "whyoolw/sharednd"
        "nightwatch75/todo"
        "noctalia/translator"
        "icefish/phone-connect"
        "kjvdven/case-convert"
        "fel/ocr"
        "yocraft/qrcode"
        "nilsonlinux/speedtest-meter"
        "aristides/udiskie"
        "notfinaldev/web-search"
        "zyrex/run-path"
      ];

      source = let
        prefix = "noctalia-plugins-";
      in
        inputs
        |> filterAttrs (name: _: hasPrefix prefix name)
        |> mapAttrs (_: toString)
        |> mapAttrs (_: removePrefix prefix)
        |> mapAttrs (name: location: {
          enabled = true;
          inherit name location;
          kind = "path";
        })
        |> attrValues;
    };

    plugin_settings = {
      "aristides/udiskie" = {
        manager_open_near_click = true;
        manager_placement = "attached";
      };
      "nightwatch75/file-search" = {
        exclude_dirs = "node_modules, target";
        panel_open_near_click = false;
        panel_placement = "floating";
        panel_position = "center";
      };
      "nilsonlinux/speedtest-meter" = {
        speedtest_position = "center";
      };
      "noctalia/notes" = {
        panel_position = "center";
      };
      "notfinaldev/web-search" = {
        provider = "duckduckgo";
        links =
          {
            GitHub = "https://github.com";
            Codeberg = "https://codeberg.org";
            YouTube = "https://youtube.com";
            Gmail = "https://mail.google.com";
            Reddit = "https://reddit.com";
          }
          |> mapAttrsToList (name: url: "${name}|${url}");
      };
      "thepunkoff/pomodoro" = {
        panel_placement = "floating";
        panel_position = "center";
      };
    };
  };
}
