{
  rustPlatform,
  fetchFromGitHub,
  fetchpatch,
  lib,
  helix,
  helix-unwrapped,
}: let
  steelix-unwrapped = helix-unwrapped.overrideAttrs (finalAttrs: _: {
    pname = "steelix-unwrapped";
    version = "0-unstable-2026-08-31";

    src = fetchFromGitHub {
      owner = "mattwparas";
      repo = "helix";
      rev = "ba5b022c1000a0ce28d4ce1d09acdd062a83a020";
      hash = "sha256-vJ7VgxuM/Dp7vyVlu6EXjP/ES14TALy64jgzyuYZl6g=";
    };

    cargoDeps = rustPlatform.fetchCargoVendor {
      inherit (finalAttrs) src pname version;
      hash = "sha256-gxX/gXJ9cIAShQTBSZcmAcX4qahE3zoYYmKzmFHqV7E=";
    };

    cargoBuildFlags = [
      "--package"
      "helix-term"
      "--features"
      "steel,git"
    ];

    patches = [
      (fetchpatch {
        name = "revert-dylib-grammar-extension.patch";
        url = "https://github.com/helix-editor/helix/commit/430914b298a32653ab1847fdfdf2177a002be04c.patch";
        revert = true;
        hash = "sha256-4KUFppkso4/XwNU+mGIgLvl+mJXHZWkmaguYMy8oTyI=";
      })
    ];

    doInstallCheck = false;
  });
in
  (helix.override {
    helix-unwrapped = steelix-unwrapped;
  }).overrideAttrs
  (
    _: previousAttrs: {
      pname = "steelix";
      strictDeps = true;

      meta =
        previousAttrs.meta
        // {
          description = "Helix editor with Steel (Scheme) scripting support";
          longDescription = ''
            Steelix is a fork of the Helix editor with Steel (Scheme) scripting support.
          '';
          homepage = "https://github.com/mattwparas/helix";
          changelog = "https://github.com/mattwparas/helix/blob/${steelix-unwrapped.src.rev}/CHANGELOG.md";
          license = lib.licenses.mpl20;
          mainProgram = "hx";
          maintainers = with lib.maintainers; [
            aciceri
            Ra77a3l3-jar
          ];
        };

      passthru =
        previousAttrs.passthru
        // {
          updateScript = ./update.sh;
        };
    }
  )
