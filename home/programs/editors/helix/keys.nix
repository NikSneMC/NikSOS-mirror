{
  programs.helix.settings.keys = {
    normal = {
      C-p = ":lsp-workspace-command tinymist.pinMain \"%sh{realpath %{buffer_name}}\"";
      space = {
        "." = "no_op";
        B = ":sh git log -n 5 --format='format:%%h (%%an: %%ar) %%s' --no-patch -L%{cursor_line},+1:%{buffer_name}";
        E = "file_explorer_in_current_buffer_directory";
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
