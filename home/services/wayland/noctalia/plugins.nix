{
  programs.noctalia.settings.plugins = {
    source = [
      {
        auto_update = false;
        enabled = true;
        kind = "git";
        location = "https://github.com/noctalia-dev/official-plugins";
        name = "official";
      }
      {
        auto_update = false;
        enabled = true;
        kind = "git";
        location = "https://github.com/noctalia-dev/community-plugins";
        name = "community";
      }
    ];
    enabled = [
      "noctalia/bongocat"
      "noctalia/translator"
    ];
  };
}
