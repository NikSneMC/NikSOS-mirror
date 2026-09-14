{
  den.aspects.hardened-sudo = {
    os = {lib, ...}: let
      inherit (lib) mkForce;
    in {
      security.sudo = {
        enable = true;

        wheelNeedsPassword = mkForce true;

        execWheelOnly = mkForce true;

        extraConfig = ''
          Defaults lecture = never
          Defaults pwfeedback
          Defaults env_keep += "EDITOR DISPLAY"
          Defaults timestamp_timeout = 0
        '';
      };
    };
  };
}
