{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git
    uutils-coreutils-noprefix
    wget
  ];

  # Set your time zone.
  time.timeZone = "Europe/Copenhagen";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_DK.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "da_DK.UTF-8";
    LC_IDENTIFICATION = "da_DK.UTF-8";
    LC_MEASUREMENT = "da_DK.UTF-8";
    LC_MONETARY = "da_DK.UTF-8";
    LC_NAME = "da_DK.UTF-8";
    LC_NUMERIC = "da_DK.UTF-8";
    LC_PAPER = "da_DK.UTF-8";
    LC_TELEPHONE = "da_DK.UTF-8";
    LC_TIME = "da_DK.UTF-8";
  };

  system = {
    rebuild.enableNg = true;
    autoUpgrade = {
      enable = true;
      dates = "daily";
    };
  };

  nix = {
   # channel.enable = false;
    settings = {
      substituters = [""];
      trusted-public-keys = [""];
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
    };
  };
  # Configure console keymap
  console = {
    #useXkbConfig = true;
  };

  # Enable Network
  networking = {
    useNetworkd = true;
    networkmanager.enable = true;
  };

  security.sudo-rs.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
