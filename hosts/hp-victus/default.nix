{
  settings,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./nvidia.nix
    ./hardware-configuration.nix
    #inputs.solaar.nixosModules.solaar
    #linuxKernel.packages.linux_zen  inputs.nixos-cachyos-kernel.nixosModules.default
    inputs.nixos-facter-modules.nixosModules.facter
    {config.facter.reportPath = ./facter.json;}
  ];
  networking.hostName = "hp-victus";
  # Automatic login for the user.
  services.displayManager.autoLogin = {
    enable = false;
    user = "${settings.username}";
  };
  hardware.logitech.wireless = {
    enable = true;
    enableGraphical = true;
  };
  boot = {
    kernelPackages = with pkgs; linuxPackagesFor linux_zen;
  };
}
