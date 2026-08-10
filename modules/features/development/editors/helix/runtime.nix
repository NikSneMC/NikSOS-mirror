{
  config,
  inputs,
}: {
  stdenv,
  lib,
  symlinkJoin,
  includeGrammarIf ? _: true,
  grammarOverlays ? [],
  ...
}: let
  inherit (builtins) fromTOML readFile hasAttr match elemAt elem filter fetchTree listToAttrs attrValues;
  inherit (lib) hasPrefix optionalString makeExtensible pipe filterAttrs isDerivation;

  bundledLanguagesConfig =
    "${inputs.helix}/languages.toml"
    |> readFile
    |> fromTOML;

  languagesConfig = config.programs.helix.languages;

  isGitGrammar = grammar:
    hasAttr "source" grammar
    && hasAttr "git" grammar.source
    && hasAttr "rev" grammar.source;

  isGitHubGrammar = grammar: hasPrefix "https://github.com" grammar.source.git;

  toGitHubFetcher = url: let
    matches = match "https://github.com/([^/]*)/([^/]*)/?" url;
  in {
    owner = elemAt matches 0;
    repo = elemAt matches 1;
  };

  useGrammar = grammar:
    if languagesConfig ? use-grammars.only
    then elem grammar.name languagesConfig.use-grammars.only
    else if languagesConfig ? use-grammars.except
    then !(elem grammar.name languagesConfig.use-grammars.except)
    else true;

  bundledGrammars =
    bundledLanguagesConfig.grammar
    |> map (grammar: grammar.name);

  grammarsToUse =
    languagesConfig.grammar or []
    |> filter ({name, ...}: !(elem name bundledGrammars))
    |> filter useGrammar;

  gitGrammars = filter isGitGrammar grammarsToUse;

  buildGrammar = grammar: let
    gh = toGitHubFetcher grammar.source.git;
    sourceGit = fetchTree {
      type = "git";
      url = grammar.source.git;
      rev = grammar.source.rev;
      ref = grammar.source.ref or "HEAD";
      shallow = true;
    };
    sourceGitHub = fetchTree {
      type = "github";
      owner = gh.owner;
      repo = gh.repo;
      inherit (grammar.source) rev;
    };
    source =
      if isGitHubGrammar grammar
      then sourceGitHub
      else sourceGit;
  in
    stdenv.mkDerivation {
      pname = "helix-tree-sitter-${grammar.name}";
      version = grammar.source.rev;

      src = source;
      sourceRoot =
        if hasAttr "subpath" grammar.source
        then "source/${grammar.source.subpath}"
        else "source";

      dontConfigure = true;

      FLAGS = [
        "-Isrc"
        "-g"
        "-O3"
        "-fPIC"
        "-fno-exceptions"
        "-Wl,-z,relro,-z,now"
      ];

      NAME = grammar.name;

      buildPhase = ''
        runHook preBuild

        if [[ -e src/scanner.cc ]]; then
          $CXX -c src/scanner.cc -o scanner.o $FLAGS
        elif [[ -e src/scanner.c ]]; then
          $CC -c src/scanner.c -o scanner.o $FLAGS
        fi

        $CC -c src/parser.c -o parser.o $FLAGS
        $CXX -shared -o $NAME.so *.o

        runHook postBuild
      '';

      installPhase = ''
        runHook preInstall
        mkdir -p $out/grammars
        mv $NAME.so $out/grammars
        if [[ -e queries ]]; then
          mkdir -p $out/queries/$NAME
          cp -r queries/* $out/queries/$NAME/
          find $out/queries/$NAME -type l -delete
        fi
        runHook postInstall
      '';

      fixupPhase =
        optionalString stdenv.hostPlatform.isLinux
        # sh
        ''
          runHook preFixup
          $STRIP $out/grammars/$NAME.so
          runHook postFixup
        '';
    };

  grammarsToBuild = filter includeGrammarIf gitGrammars;

  builtGrammars =
    map (grammar: {
      inherit (grammar) name;
      value = buildGrammar grammar;
    })
    grammarsToBuild;

  extensibleGrammars = makeExtensible (_: listToAttrs builtGrammars);

  overlaidGrammars =
    pipe extensibleGrammars
    (map (overlay: grammar: grammar.extend overlay) grammarOverlays);
in
  symlinkJoin {
    name = "helix-runtime";
    paths =
      overlaidGrammars
      |> filterAttrs (_: v: isDerivation v)
      |> attrValues;
    preferLocalBuild = true;
  }
