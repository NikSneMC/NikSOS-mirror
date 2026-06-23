{lib, ...}: let
  inherit (builtins) substring stringLength;
  inherit (lib) toUpper;

  mkUpper = str:
    (toUpper (substring 0 1 str)) + (substring 1 (stringLength str) str);
in {
  inherit mkUpper;
}
