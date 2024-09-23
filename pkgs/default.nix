{
  systems = [ "x86_64-linux" ];

  perSystem = {
    pkgs,
    inputs',
    ...
  }: {
    packages = {
      spoofdpi = pkgs.callPackage ./spoofdpi {};
    };
  };
}
