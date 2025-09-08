{ settings, inputs, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    #inputs.solaar.nixosModules.solaar
    #linuxKernel.packages.linux_zen  inputs.nixos-cachyos-kernel.nixosModules.default
    inputs.nixos-facter-modules.nixosModules.facter
    {config.facter.reportPath = ./facter.json;}
  ];
  networking.hostName = "thinkpad-l540";
  # Automatic login for the user.
  services.displayManager.autoLogin = {
    enable = false;
    user = "${settings.username}";
  };
  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
    kernelModules = [ "drm" ];
    #extraModulePackages = with pkgs.linuxPackages_zen; [linux-zen ];
  };
}
