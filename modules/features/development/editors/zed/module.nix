{
  den.aspects.zed = {
    homeManager = {pkgs, ...}: {
      imports = [
        ./extensions.nix
        ./settings.nix
      ];

      programs.zed-editor = {
        enable = true;

        installRemoteServer = true;

        extraPackages = with pkgs; [
          nil
          alejandra
        ];
      };
    };
  };
}
