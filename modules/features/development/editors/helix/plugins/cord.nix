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
          details = "Probably some work-related stuff";
          state = "Dealing with some \${name}";
        }
        {
          glob = "^~/Education/University";
          details = "Probably some uni-related stuff";
          state = "Dealing with some \${name}";
        }
        {
          glob = "^/";
          details = "Probably some private stuff";
          state = "Dealing with some \${name}";
        }
      ];
    };
  };
}
