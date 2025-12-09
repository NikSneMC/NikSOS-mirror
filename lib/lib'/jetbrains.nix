_: let
  mkIdes = pkgs: ides: plugins:
    ides
    |> map (
      ide:
        {
          package = pkgs.jetbrains.${ide}.override {
            vmopts = ''
              -Dnosplash=true
            '';
          };
        }
        // (
          if plugins ? ide
          then {plugins' = plugins.${ide};}
          else {}
        )
    )
    |> map (
      {
        package,
        plugins' ? [],
      }:
        pkgs.jetbrains.plugins.addPlugins package (plugins.common ++ plugins')
    );
in {
  inherit mkIdes;
}
