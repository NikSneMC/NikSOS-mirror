{
  systems = ["x86_64-linux"];

  perSystem = {
    pkgs,
    inputs',
    ...
  }: {
    packages = {
      spoof-dpi = pkgs.callPackage ./spoof-dpi {};
    };
  };
}
