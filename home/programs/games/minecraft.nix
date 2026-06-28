{pkgs, ...}: {
  home.packages = with pkgs; [
    (prismlauncher.override {
      jdks = [
        zulu8
        zulu11
        zulu17
        zulu21
        zulu25
      ];
    })
  ];
}
