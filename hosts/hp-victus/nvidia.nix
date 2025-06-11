{ config, ... }:

{
  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    # Enable PRIME offloading
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      # Correct Bus IDs for your system
      amdgpuBusId = "PCI:07:00:0";
      nvidiaBusId = "PCI:01:00:0";
    };

    # Use the proprietary Nvidia kernel module
    open = false;

    # Enable the NVIDIA settings GUI (accessible via `nvidia-settings`)
    nvidiaSettings = true;

    # Driver package (stable version)
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Set environment variables
  environment.variables = {
    __NV_PRIME_RENDER_OFFLOAD = "1";
    __NV_PRIME_RENDER_OFFLOAD_PROVIDER = "NVIDIA-G0";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    __VK_LAYER_NV_optimus = "NVIDIA_only";
  };
}
    # Modesetting is required.
   #modesetting.enable = true;
