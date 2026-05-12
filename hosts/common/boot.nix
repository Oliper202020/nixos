{
  pkgs,
  ...
}:
{
  boot = {
    plymouth = {
      enable = true;
      #  logo = ./theming/boot-logo.png;
      theme = "framework";
      themePackages = [ pkgs.framework-plymouth-theme ];
    };

    # Enable "Silent Boot"
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "udev.log_level=3"
      "systemd.show_status=auto"
    ];
    # Hide the OS choice for bootloaders.
    # It's still possible to open the bootloader list by pressing any key
    # It will just not appear on screen unless a key is pressed
    loader = {
      systemd-boot = {
        enable = true;
        # netbootxyz.enable = true;
      };
      efi.canTouchEfiVariables = true;
      timeout = 0;
    };
  };
}
