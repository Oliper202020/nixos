{ config, pkgs, settings, ... }:
{
  users.users.${settings.username} = {
    shell = pkgs.fish;
    ignoreShellProgramCheck = true;
    isNormalUser = true;
    description = "${settings.full-name}";
    extraGroups = ["networkmanager" "wheel"];
  };
  
  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "${settings.username}";

  networking = {
    hostName = "${settings.username}"; # Define your hostname.
    networkmanager.enable = true;
  };
}


