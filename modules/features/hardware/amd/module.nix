{
  den.aspects.amd = {
    os = {
      boot.initrd.kernelModules = ["amdgpu"];
      services.xserver.videoDrivers = ["amdgpu"];
    };
  };
}
