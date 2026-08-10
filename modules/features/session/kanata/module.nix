{
  den.aspects.kanata = {
    os = let
      inherit (builtins) readFile;
    in {
      services.kanata = {
        enable = true;

        keyboards.default = {
          extraDefCfg = ''
            concurrent-tap-hold yes
            process-unmapped-keys yes
          '';
          config = readFile ./main.kbd;
        };
      };
    };
  };
}
