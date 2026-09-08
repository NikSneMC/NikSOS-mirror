{
  programs.helix.settings.keys = {
    normal = {
      C-p = ":lsp-workspace-command tinymist.pinMain \"%sh{realpath %{buffer_name}}\"";
      space = {
        "." = "no_op";
        l = [
          ":new"
          ":insert-output lazygit"
          ":buffer-close!"
          ":redraw"
          ":reload-all"
        ];
      };
    };
  };
}
