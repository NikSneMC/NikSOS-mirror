{
  programs.nhx.plugins.cord = {
    enable = true;

    config = {
      display = {
        theme = "catppuccin";
        flavor = "accent";
      };

      extensions = {
        scoped-timestamps = {
          enable = true;
          scope = "workspace";
        };
        zellij = {
          enable = true;
          onDetach = "hide";
        };
      };

      workspaceRules = [
        {
          glob = [
            "^~/Projects/probe"
            "^~/Projects/nik/public"
            "^~/Projects/nik/contrib"
            "^~/Projects/nik/probe"
          ];
        }
        {
          glob = "^~/Projects/[^/]+/work";
          state = "Dealing with some \${name}";
          details = "Probably some work-related stuff";
        }
        {
          glob = "^~/Education/University";
          state = "Dealing with some \${name}";
          details = "Probably some uni-related stuff";
        }
        {
          path = "~/.local/cache/helix/helix.log";
          state = "Reading helix log file";
          details = false;
        }
        {
          glob = "^/";
          state = "Dealing with some \${name}";
          details = "Probably some private stuff";
        }
      ];
    };
  };
}
