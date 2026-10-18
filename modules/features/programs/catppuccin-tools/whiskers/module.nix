{
  den.aspects.whiskers = {
    homeManager = {inputs', ...}: {
      home.packages = [inputs'.catppuccin.packages.whiskers];
    };
  };
}
