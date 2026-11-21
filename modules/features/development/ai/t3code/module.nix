{
  den.aspects.t3code = {
    packages = {pkgs, ...}: {
      t3code-nightly = pkgs.t3code.override {
        t3code-unwrapped = pkgs.t3code.unwrapped.overrideAttrs (finalAttrs: {
          version = "0.1.12-nightly.20261120.5009";
          src = pkgs.fetchFromGitHub {
            owner = "pingdotgg";
            repo = "t3code";
            tag = "v${finalAttrs.version}";
            hash = "sha256-QPZpT/1zm5sLIDw3AOzUCIrmOFPwUU8jP/q1A8GzLow=";
          };
        });
      };
    };

    homeManager = {self', ...}: {
      programs.t3code = {
        enable = true;
        package = self'.packages.t3code-nightly;
      };
    };

    provides = {
      server.homeManager = {self', ...}: {
        programs.t3code = {
          package = self'.packages.t3code-nightly;
          server = {
            enable = true;
          };
        };
      };
    };
  };
}
