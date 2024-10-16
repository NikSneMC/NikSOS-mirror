{
  systems = ["x86_64-linux"];

  perSystem = {
    pkgs,
    inputs',
    ...
  }: {
    packages = with pkgs; {
      repl = callPackage ./repl {};
    };
  };
}
