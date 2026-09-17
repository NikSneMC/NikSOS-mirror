{
  flake-file.inputs = {
    nixcord = {
      url = "github:4evy/nixcord";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        nixpkgs-nixcord.follows = "nixpkgs";
        home-manager.follows = "home-manager";
        nix-darwin.follows = "";
      };
    };
  };

  den.aspects.discord = {
    homeManager = {
      config,
      inputs,
      ...
    }: {
      imports = [
        inputs.nixcord.homeModules.nixcord
        ./plugins
      ];
      programs.nixcord = {
        enable = true;

        discord.vencord.enable = true;
        equibop = {
          enable = true;
          settings = {
            tray = true;
            minimizeToTray = true;
            arRPC = true;
            staticTitle = true;
            trayMainOverride = false;
            splashColor = "#${config.theme.colors.text}";
            splashBackground = "#${config.theme.colors.base}";
            trayColorType = "custom";
            trayAutoFill = "auto";
            disableMinSize = true;
            splashAnimationPath = "/var/lib/AccountsService/icons/${config.home.username}";
          };
        };

        config = let
          themes = [
            "https://catppuccin.github.io/discord/dist/catppuccin-${config.theme.flavor}-${config.theme.accent}.theme.css"
            "https://raw.githubusercontent.com/NikSneMC/discord-css/main/jetbrainsmono-nerd-font.css"
            "https://raw.githubusercontent.com/NikSneMC/discord-css/main/make-discord-ui-great-again.css"
          ];
        in {
          autoUpdate = true;
          autoUpdateNotification = true;
          disableMinSize = true;
          themeLinks = themes;
          enabledThemeLinks = themes;
          enableReactDevtools = true;
          frameless = true;
          notifyAboutUpdates = true;
        };
      };
    };
  };
}
