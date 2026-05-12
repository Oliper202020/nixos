{
  settings,
  pkgs,
  ...
}:
{
  imports = [
    ./config.nix
    #./disko-config.nix
    ./disk-configuration.nix
    ../../modules/home-manager/programs/misc/spicetify.nix
  ];
  nixpkgs.hostPlatform = "x86_64-linux";
  networking.hostName = "framework";
  hardware.facter.reportPath = ./facter.json;
  # Automatic login for the user.
  services.displayManager.autoLogin = {
    enable = false;
    user = "${settings.username}";
  };
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    # kernelPackages = pkgs.linuxKernel.packages.linux_zen;
    kernelModules = [
      "drm"
      "kvm"
      "kvm_amd"
    ];
    kernelParams = [ "amd_pstate=active" ];
    #extraModulePackages = with pkgs.linuxPackages_zen; [linux-zen ];
  };
  services.fwupd.enable = true;
}
