{
  programs.helix = {
    languages = {
      language-server.lisette-lsp = {
        command = "lis";
        args = ["lsp"];
      };
      language = [
        {
          name = "lisette";
          scope = "source.lisette";
          injection-regex = "lis|lisette";
          file-types = ["lis"];
          roots = ["lisette.toml"];
          auto-format = true;
          comment-tokens = ["//" "///"];
          language-servers = ["lisette-lsp"];
          indent = {
            tab-width = 2;
            unit = "  ";
          };
        }
      ];
    };
  };
}
