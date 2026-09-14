{
  programs.nhx = {
    plugins.splash-hx = {
      enable = true;
      requirePath = "splash-hx/splash.scm";
    };

    steel.extra =
      # scheme
      ''
        (when (equal? (length (command-line)) 1)
          (show-splash))
      '';
  };
}
