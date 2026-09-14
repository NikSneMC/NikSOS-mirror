{pkgs, ...}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "sql";
          auto-format = true;
          formatter.command = "sleek";
        }
      ];
    };

    extraPackages = with pkgs; [
      sleek
    ];

    steelixGrammarOverrides = [
      {
        name = "sql";
        fetcher = "github";
        owner = "DerekStride";
        repo = "tree-sitter-sql";
        rev = "86e3d03837d282544439620eb74d224586074b8b";
        hash = "sha256-O2FkTwt/I+tOXtpMbsxkgU+v64Ie9fh73ZZRm3E83no=";
      }
    ];
  };
}
