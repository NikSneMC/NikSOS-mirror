{lib}: let
  inherit (builtins) genList elemAt length;
  inherit (lib) stringToCharacters listToAttrs nameValuePair imap0 concatStrings;

  printable =
    " !\"#$%&'()*+,-./0123456789:;<=>?@"
    + "ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`"
    + "abcdefghijklmnopqrstuvwxyz{|}~";

  codeOf =
    (
      printable
      |> stringToCharacters
      |> imap0 (i: c: nameValuePair c (i + 32))
      |> listToAttrs
    )
    // {"\n" = 10;};

  b64chars = stringToCharacters "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

  toBase64 = str: let
    bytes = map (c: codeOf.${c}) (stringToCharacters str);
    len = length bytes;
    byteAt = i:
      if i < len
      then elemAt bytes i
      else 0;

    chunk = i: let
      o = i * 3;
      n = byteAt o * 65536 + byteAt (o + 1) * 256 + byteAt (o + 2);
      rest = len - o;
      sextet = shift: elemAt b64chars (n / shift - (n / (shift * 64)) * 64);
    in
      if rest >= 3
      then sextet 262144 + sextet 4096 + sextet 64 + sextet 1
      else if rest == 2
      then sextet 262144 + sextet 4096 + sextet 64 + "="
      else sextet 262144 + sextet 4096 + "==";
  in
    concatStrings (genList chunk ((len + 2) / 3));
in {
  inherit toBase64;
}
