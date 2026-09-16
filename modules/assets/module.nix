{inputs, ...}: {
  _module.args.assets = builtins.path {
    path = inputs.self + "/assets";
    name = "niksos-assets";
  };
}
