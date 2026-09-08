{config}: {
  lib,
  path,
  runCommand,
  tree-sitter,
}: let
  inherit (builtins) attrNames elem fetchTree filter substring;
  inherit (lib) concatMapStringsSep importJSON;

  languages = config.programs.helix.languages;

  bundled =
    "${path}/pkgs/by-name/he/helix/grammars.json"
    |> importJSON
    |> attrNames;

  extraGrammars =
    languages.grammar or []
    |> filter ({
      name,
      source,
      ...
    }:
      !(elem name bundled)
      && source ? git
      && source ? rev);

  buildGrammar = {
    name,
    source,
    ...
  }:
    tree-sitter.buildGrammar {
      language = name;
      version = substring 0 7 source.rev;
      src = fetchTree {
        type = "git";
        url = source.git;
        inherit (source) rev;
        shallow = true;
      };
      location = source.subpath or null;
    };
in
  runCommand "helix-extra-runtime" {} ''
    mkdir -p $out/grammars $out/queries
    ${concatMapStringsSep "\n" (grammar: ''
        install -D ${buildGrammar grammar}/parser $out/grammars/${grammar.name}.so
        if [ -d ${buildGrammar grammar}/queries ]; then
          cp -r ${buildGrammar grammar}/queries $out/queries/${grammar.name}
        fi
      '')
      extraGrammars}
  ''
