{ config, ... }: let
  detectNvidia =
    builtins.pathExists "/sys/class/drm/card0/device/vendor"
    && builtins.readFile "/sys/class/drm/card0/device/vendor" == "0x10de\n";

  detectLaptop =
    builtins.pathExists "/sys/class/dmi/id/chassis_type"
    && builtins.elem (builtins.readFile "/sys/class/dmi/id/chassis_type") ["8\n" "9\n" "10\n" "11\n"];

  hasNvidiaConfig = builtins.hasAttr "nvidia" config.hardware;
  
  # Determine imports based on hardware detection
  importsList = if detectNvidia then
    if detectLaptop then
      [ ./nvidia-laptop.nix ]
    else
      [ ./nvidia-desktop.nix ]
  else
    [];

  # Trace the decision for logging if NVIDIA is detected and no configuration exists yet
  traceMessage = if detectNvidia && !hasNvidiaConfig then
    builtins.trace (
      "NVIDIA detected: " + builtins.toString detectNvidia + 
      ", Laptop detected: " + builtins.toString detectLaptop + "\n" +
      "Imports: " + builtins.toString importsList
    ) importsList
  else
    importsList;
in

# Return imports, including the trace if needed
{
  imports = traceMessage;
}

