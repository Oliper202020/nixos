{
  pkgs,
  settings,
  ...
}: {
  # Enable automatic login for the user.
  services.displayManager.autoLogin = {
    enable = false;
    user = "${settings.username}";
  };

  networking = {
    hostName = "${settings.username}"; # Define your hostname.
    networkmanager.enable = true;
  };
}
