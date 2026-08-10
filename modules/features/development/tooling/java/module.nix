{
  den.aspects.java = {
    os = {pkgs, ...}: {
      programs.java = {
        enable = true;
        package = pkgs.zulu21;
      };

      environment.variables.JAVA_HOME = "${pkgs.zulu25}/";
    };

    homeManager = {pkgs, ...}: {
      programs.java = {
        enable = true;
        package = pkgs.zulu21;
      };
    };
  };
}
