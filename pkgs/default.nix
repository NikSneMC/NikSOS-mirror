{
  systems = ["x86_64-linux"];

  perSystem = {
    pkgs,
    inputs',
    ...
  }: {
    packages = {
      spoof-spi = pkgs.callPackage ./spoof-dpi {};
    };
  };
}
