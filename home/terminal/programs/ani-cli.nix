{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    (pkgs.ani-cli.overrideAttrs (old: {
      postPatch =
        (old.postPatch or "")
        + ''
          substituteInPlace ani-cli \
            --replace-fail \
              '[ "$use_external_menu" = "2" ] && dmenu -l 20 -p "$2"' \
              '[ "$use_external_menu" = "2" ] && noctalia dmenu -p "$2"'
        '';

      buildInputs = (old.buildInputs or []) ++ [config.programs.noctalia.package];
    }))
  ];
}
