{lib, ...}: let
  inherit (builtins) isBool isString isInt isList concatStringsSep typeOf isAttrs concatMap;
  inherit (lib) filterAttrs mapAttrsToList;
  inherit (lib.generators) toKeyValue;

  mkValueString = value:
    if isBool value
    then
      if value
      then "true"
      else "false"
    else if isInt value
    then toString value
    else if (value._type or "") == "literal"
    then value.value
    else if isString value
    then ''"${value}"''
    else if isList value
    then "[ ${concatStringsSep "," (map mkValueString value)} ]"
    else abort "Unhandled value type ${typeOf value}";

  mkKeyValue = {
    sep ? ": ",
    end ? ";",
  }: name: value: "${name}${sep}${mkValueString value}${end}";

  mkRasiSection = name: value:
    if isAttrs value
    then let
      toRasiKeyValue = toKeyValue {mkKeyValue = mkKeyValue {};};
      # Remove null values so the resulting config does not have empty lines
      configStr = toRasiKeyValue (filterAttrs (_: v: v != null) value);
    in ''
      ${name} {
      ${configStr}}
    ''
    else
      (mkKeyValue {
          sep = " ";
          end = "";
        }
        name
        value)
      + "\n";

  toRasi = attrs:
    [
      (filterAttrs (n: _: n == "@theme") attrs)
      (filterAttrs (n: _: n == "@import") attrs)
      (removeAttrs attrs ["@theme" "@import"])
    ]
    |> concatMap (mapAttrsToList mkRasiSection)
    |> concatStringsSep "\n";
in {
  inherit mkValueString mkKeyValue mkRasiSection toRasi;
}
