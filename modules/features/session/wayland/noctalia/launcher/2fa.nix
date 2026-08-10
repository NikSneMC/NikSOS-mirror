{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (lib) getExe;
in {
  programs.noctalia.settings.shell.launcher.dmenu.entry."2fa" = let
    jsonFile = "${config.home.homeDirectory}/.2fa.json";

    script = ''
      json_file="${jsonFile}"
      account="{selection}"

      secret=$(
        jaq -r --arg account "$account" \
          ".db.entries[]
          | select(((.name + \"\t\" + .issuer) | ascii_downcase) == \$account)
          | .info.secret" \
          "$json_file"
      )

      ${getExe pkgs.oath-toolkit} --totp -b "$secret" | wl-copy
      notify-send "Copied token for $account"
    '';
  in {
    prefix = "2fa";
    label = "2FA Codes";
    glyph = "auth-2fa";
    freeform = false;
    global = false;

    command = ''
      jaq -r \
        '.db.entries[]
        | "\(.name)\t\(.issuer)"
        | ascii_downcase' \
        ${jsonFile}
    '';

    exec = "sh -lc '${script}'";
  };
}
