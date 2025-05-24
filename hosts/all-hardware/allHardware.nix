# all hardware for *installed* systems

{ modulesPath, ... }:
{

  imports = [
    # from nixpkgs
    "${modulesPath}/profiles/all-hardware.nix" # all hardware, just so installers from USB / etc. can run
    # from here
    #./common.nix
    #./pveGuestHwSupport.nix # also for guest agent, serial out, ...
  ];
  nix = {
    channel.enable = false;
    settings.experimental-features = ["nix-command" "flakes"];
  };
  config = {
    boot.initrd.availableKernelModules = [
      # to find boot drive
      "mmc_block" # e.g. Surface 3
      "sdhci-acpi" # e.g. Surface 3
    ];
  };

}
