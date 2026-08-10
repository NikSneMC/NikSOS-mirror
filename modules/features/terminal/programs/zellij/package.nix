{
  fetchFromGitHub,
  rustPlatform,
  zellij-unwrapped,
  zellij,
}: let
  version = "0.45.0-unstable-2026-08-19";

  src = fetchFromGitHub {
    owner = "zellij-org";
    repo = "zellij";
    rev = "b961fac6fbfb70f70f2d6b845e02db8acbc0a333";
    hash = "sha256-BhtEmP0hNgQR78SAr8A8WHtsESc105Qnfu3d7Edy7zA=";
  };
in
  zellij.override {
    zellij-unwrapped = zellij-unwrapped.overrideAttrs (prevAttrs: {
      inherit version src;

      cargoDeps = rustPlatform.fetchCargoVendor {
        inherit (prevAttrs) pname;
        inherit version src;
        hash = "sha256-N4G5LNqzbfTiK57gY/98ftBUMtjfAxqdCbnC/pFjEUk=";
      };

      doInstallCheck = false;

      postInstall = ''
        installShellCompletion --cmd zellij \
          --bash <($out/bin/zellij setup --generate-completion bash) \
          --fish <($out/bin/zellij setup --generate-completion fish) \
          --zsh <($out/bin/zellij setup --generate-completion zsh)
      '';
    });
  }
