{inputs}: {
  ncurses,
  runCommand,
}:
runCommand "rio-terminfo" {
  nativeBuildInputs = [ncurses];
} ''
  install -dm 755 "$out/share/terminfo"
  tic -x -o "$out/share/terminfo" ${inputs.rio}/misc/rio.terminfo
''
