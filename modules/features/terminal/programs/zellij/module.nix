{den, ...}: {
  den.aspects = {
    zellij-web = {
      includes = with den.aspects; [
        acme
        nginx
        zellij
      ];

      os = {config, ...}: {
        networking.firewall.interfaces.amn0.allowedTCPPorts = [443];

        services.nginx.virtualHosts."zellij.${config.networking.hostName}.niksne.ru" = {
          forceSSL = true;
          enableACME = true;

          locations."/" = {
            proxyPass = "http://127.0.0.1:8082";
            proxyWebsockets = true;
          };
        };
      };

      homeManager.programs.zellij.settings = {
        web_server = true;
        web_sharing = "on";
      };
    };

    zellij = {
      homeManager = {pkgs, ...} @ args: let
        inherit (builtins) concatStringsSep;
      in {
        imports = [./layouts];

        programs.zellij = {
          enable = true;

          package = pkgs.callPackage ./package.nix {};

          enableFishIntegration = true;
          exitShellOnExit = true;

          settings = {
            default_layout = "custom";

            pane_frame_style = "full";
            mirror_session = true;
            show_startup_tips = false;
            show_release_notes = false;
            ui.pane_frames.rounded_corners = true;
          };

          extraConfig =
            [
              ./plugins.nix
              ./binds.nix
            ]
            |> map (file: import file args)
            |> concatStringsSep "\n";
        };
      };
    };
  };
}
