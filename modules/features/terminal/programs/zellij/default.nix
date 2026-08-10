{pkgs, ...} @ args: let
  inherit (builtins) concatStringsSep;
in {
  imports = [./layouts];

  programs.zellij = {
    enable = true;

    package = pkgs.callPackage ./package.nix {};

    enableFishIntegration = true;
    exitShellOnExit = true;

    settings = {
      default_layout = "custom";

      pane_frame_style = "full";
      mirror_session = true;
      show_startup_tips = false;
      show_release_notes = false;
      ui.pane_frames.rounded_corners = true;
    };

    extraConfig =
      [
        ./plugins.nix
        ./binds.nix
      ]
      |> map (file: import file args)
      |> concatStringsSep "\n";
  };
}
