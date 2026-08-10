{
  den.aspects.git = {
    homeManager = {pkgs, ...}: {
      imports = [
        ./delta.nix
        ./lazygit.nix
      ];

      programs.git = {
        enable = true;
        package = pkgs.git;

        settings = {
          diff.colorMoved = "default";
          merge.conflictstyle = "diff3";
          pull.rebase = false;
        };

        settings.safe.directory = ["*"];

        ignores = [
          "*~"
          "*.swp"
          "*result*"
          "kls_database.db"
          "**/.project"
          "**/.settings"
          "**/.classpath"
          "**/.factorypath"
          "**/bin"
        ];

        settings.credential.helper = "store";

        signing = {
          signByDefault = true;
          format = "ssh";
        };
        settings.gpg.format = "ssh";
      };
    };
  };
}
