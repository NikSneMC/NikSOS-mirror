{pkgs, ...}: let
  factorio = pkgs.factorio-space-age.override {
    experimental = true;
    versionsJson = pkgs.writers.writeJSON "factorio-versions" {
      x86_64-linux.expansion.experimental = {
        candidateHashFilenames = ["factorio-space-age_linux_2.1.12.tar.xz"];
        name = "factorio_expansion_x64-2.1.12.tar.xz";
        needsAuth = true;
        sha256 = "abffbe356b15081017e0d319e4498210d162557cfc61aea0c425c892ffad3214";
        tarDirectory = "x64";
        url = "https://factorio.com/get-download/2.1.12/expansion/linux64";
        version = "2.1.12";
      };
    };
  };
in {
  home = {
    packages = [factorio];
    extraDependencies = [factorio];
  };
}
