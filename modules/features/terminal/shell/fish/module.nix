{
  den.aspects.fish = {
    os = {pkgs, ...}: {
      environment.pathsToLink = ["/share/fish"];

      programs = {
        less.enable = true;

        fish.enable = true;
      };

      users.defaultUserShell = pkgs.fish;
    };

    homeManager = {
      imports = [
        ./functions
      ];

      programs.fish = {
        enable = true;
        shellInit =
          # fish
          ''
            fish_vi_key_bindings
          '';
        functions.fish_greeting.body = '''';
      };
    };
  };
}
