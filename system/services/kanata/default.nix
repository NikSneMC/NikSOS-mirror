{
  services.kanata = {
    enable = true;

    keyboards.default = {
      extraDefCfg = ''
        concurrent-tap-hold yes
        process-unmapped-keys yes
      '';
      config = builtins.readFile (./. + "/main.kbd");
    };
  };
}
