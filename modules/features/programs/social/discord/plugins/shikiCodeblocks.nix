{config, ...}: {
  programs.nixcord.config.plugins.shikiCodeblocks = {
    enable = true;
    theme = "https://cdn.jsdelivr.net/gh/shikijs/textmate-grammars-themes@bc5436518111d87ea58eb56d97b3f9bec30e6b83/packages/tm-themes/themes/catppuccin-${config.theme.flavor}.json";
    useDevIcon = "COLOR";
  };
}
