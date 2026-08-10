{
  den.aspects.hardened-sudo = {
    os = {
      pkgs,
      lib,
      ...
    }: let
      inherit (lib) mkForce getExe';
    in {
      security.sudo = {
        enable = true;

        wheelNeedsPassword = mkForce true;

        execWheelOnly = mkForce true;

        extraConfig = ''
          Defaults lecture = never
          Defaults pwfeedback
          Defaults env_keep += "EDITOR PATH DISPLAY"
          Defaults timestamp_timeout = 300
        '';

        extraRules = let
          sudoRules = with pkgs; [
            {
              package = coreutils;
              command = "sync";
            }
            {
              package = hdparm;
              command = "hdparm";
            }
            {
              package = nixos-rebuild-ng;
              command = "nixos-rebuild";
            }
            {
              package = systemd;
              command = "reboot";
            }
            {
              package = systemd;
              command = "systemctl";
            }
            {
              package = util-linux;
              command = "dmesg";
            }
          ];

          mkSudoRule = rule: {
            command = getExe' rule.package rule.command;
            options = ["NOPASSWD"];
          };

          sudoCommands = map mkSudoRule sudoRules;
        in [
          {
            groups = ["wheel"];
            commands = sudoCommands;
          }
        ];
      };
    };
  };
}
