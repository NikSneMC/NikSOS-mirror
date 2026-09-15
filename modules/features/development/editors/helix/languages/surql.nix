{
  programs.helix = {
    languages = {
      language = [
        {
          name = "surrealql";
          scope = "source.surrealql";
          file-types = ["surql"];
          comment-tokens = ["--" "//" "#"];
          block-comment-tokens = {
            start = "/*";
            end = "*/";
          };
          indent = {
            tab-width = 4;
            unit = "    ";
          };
          injection-regex = "surql";
        }
      ];
    };
  };
}
