let
  inherit (builtins) isString listToAttrs;

  mkSubvolumes = subvolumes:
    subvolumes
    |> map (
      subvolume:
        if isString subvolume
        then {
          name = subvolume;
          value = {
            mountpoint = subvolume;
          };
        }
        else {
          name = subvolume.mountpoint;
          value = subvolume;
        }
    )
    |> listToAttrs;

  mkUserSubvolumes = user: folders:
    folders
    |> map (folder: {
      mountpoint = "/home/${user}/${folder}";
      mountOptions = ["compress=zstd"];
    })
    |> mkSubvolumes;
in {
  inherit mkSubvolumes mkUserSubvolumes;
}
