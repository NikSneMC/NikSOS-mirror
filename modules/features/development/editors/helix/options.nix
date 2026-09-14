{lib, ...}: {
  options.programs.helix.steelixGrammarOverrides = lib.mkOption {
    type = lib.types.listOf (lib.types.submodule {
      options = {
        name = lib.mkOption {type = lib.types.str;};
        fetcher = lib.mkOption {type = lib.types.enum ["github" "gitlab" "codeberg"];};
        owner = lib.mkOption {type = lib.types.str;};
        repo = lib.mkOption {type = lib.types.str;};
        rev = lib.mkOption {type = lib.types.str;};
        hash = lib.mkOption {type = lib.types.str;};
      };
    });
    default = [];
    description = ''
      Per-grammar rev/hash pins for steelix's build, keeping the fork's
      bundled queries in sync with the tree-sitter grammar that gets built
      (nixpkgs' own grammars.json tracks regular helix releases, which can
      drift from steelix's own languages.toml pins).
    '';
  };

  config = {
    programs.nhx = {
      enable = true;
      package = null;
    };
  };
}
