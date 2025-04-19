{
  pkgs,
  settings,
  ...
}: {
  imports = [
    ./nvidia.nix
    ./hardware-configuration.nix
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
