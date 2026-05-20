{pkgs, ...}: {
  programs = {
    java = {
      enable = true;
      package = pkgs.zulu21;
    };
    direnv = {
      enable = true;
      silent = true;
      nix-direnv.enable = true;
      settings = {
        global = {
          load_dotenv = true;
        };
      };
    };
  };

  environment = {
    systemPackages = with pkgs; [
      gcc
      gnumake
      cargo
      cargo-binstall
      bun
      nodejs_24
      pnpm
      python3
      pipx
    ];

    variables.JAVA_HOME = "${pkgs.zulu25}/";
  };
}
