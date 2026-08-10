{
  den.aspects.python = {
    os = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        (python3.withPackages (p:
          with p; [
            repl-python-wakatime
          ]))
      ];
    };
  };
}
