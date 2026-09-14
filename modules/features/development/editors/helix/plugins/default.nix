{
  imports = [
    ./emotional.nix
    ./lsp-picker.nix
    # ./moka.nix
    ./oil.nix
    ./scopeline.nix
    ./wakatime.nix
  ];

  programs.nhx = {
    steel = {
      enable = true;
      lsp.enable = true;
    };
  };
}
