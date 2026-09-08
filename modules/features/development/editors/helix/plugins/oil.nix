{
  programs = {
    nhx.plugins.oil = {
      enable = true;
      config = {
        showDotfiles = true;
        showGitIgnored = false;

        keymaps.normal = {
          backspace = ":oil-up";
          I = ":oil-toggle-git-ignored";
          c = ":oil-cut";
          X = ":oil-clipboard-clear";
          H = ":oil-toggle-hidden";
          p = ":oil-paste";
          q = ":oil-close";
          ret = ":oil-enter";
          w = ":oil-save";
          y = ":oil-yank";
        };
      };
    };

    helix.settings.keys.normal.space = {
      e = ":oil-root";
      E = ":oil";
    };
  };
}
