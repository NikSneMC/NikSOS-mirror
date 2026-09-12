{pkgs, ...}: let
  hxLazygit = pkgs.writeShellScript "hx-lazygit" ''
    zellij action new-pane --in-place --close-on-exit -- lazygit >/dev/null
  '';
in {
  programs.helix.settings.keys = {
    normal = {
      C-p = ":lsp-workspace-command tinymist.pinMain \"%sh{realpath %{buffer_name}}\"";
      space = {
        "." = "no_op";
        l = ":run-shell-command ${hxLazygit}";
      };
    };
  };
}
