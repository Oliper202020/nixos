{
  settings,
  inputs,
  ...
}: {
  imports = [
    ./nvidia.nix
    ./hardware-configuration.nix
    inputs.nixos-cachyos-kernel.nixosModules.default
    inputs.nixos-facter-modules.nixosModules.facter
    {config.facter.reportPath = ./facter.json;}
  ];
  # Enable automatic login for the user.
  services.displayManager.autoLogin = {
    enable = false;
    user = "${settings.username}";
  };

  networking = {
    hostName = "hp-victus"; # Define your hostname.
    networkmanager.enable = true;
  };
}
