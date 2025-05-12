{ config, ... }: let
  readIfExists = path: if builtins.pathExists path then builtins.readFile path else null;

  vendorFile = readIfExists "/sys/class/drm/card0/device/vendor";
  detectNvidia = true;# vendorFile == "0x10de\n";

  chassisType = readIfExists "/sys/class/dmi/id/chassis_type";
  detectLaptop = true;#builtins.elem chassisType ["8\n" "9\n" "10\n" "11\n"];

  hasNvidiaConfig = config.hardware.nvidia.enable or false;

  importsList =
    if detectNvidia then
      if detectLaptop then
        [ ./nvidia-laptop.nix ]
      else
        [ ./nvidia-desktop.nix ]
    else
      [];

  traceMessage = if detectNvidia then# && !hasNvidiaConfig then
    builtins.trace (
      "NVIDIA detected: " + builtins.toString detectNvidia + 
      ", Laptop detected: " + builtins.toString detectLaptop + "\n" +
      "Imports: " + builtins.toString importsList
    ) importsList
  else
    importsList;
in {
  imports = traceMessage;
}
