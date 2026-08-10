{
  den.aspects.cargo = {
    homeManager = {
      lib,
      pkgs,
      ...
    }: let
      inherit (lib) getExe;
    in {
      programs.cargo = {
        enable = true;
        settings = {
          build = {
            rustc-wrapper = "${getExe pkgs.sccache}";
          };
        };
      };
    };
  };
}
