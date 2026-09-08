{
  programs = {
    nhx.plugins.emotional = {
      enable = true;
      requirePath = "emotional.hx/emotional.scm";
    };

    helix.settings.keys.normal = {
      C-k = ":move_lines_up";
      C-j = ":move_lines_down";
    };
  };
}
