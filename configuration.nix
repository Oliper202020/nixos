{pkgs, ...}: let
in {
  imports = [
    ./hardware-configuration.nix
    # Inculde the nvidia config
    # ./nvidia.nix
     ./nvidia/nvidia-selector.nix
    ./theming/theming.nix
    ./steam.nix
    ./system/nh.nix
    ./system/users.nix
    ./system/keyboard.nix
    ./system/boot.nix
    ./desktop/gnome.nix
    ./window-manager/hyprland/hyprland.nix
  ];
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    lshw
    pokeget-rs
    dconf
    wl-clipboard
    android-tools
    protonup
    any-nix-shell
    anyrun
    playerctl
    wlogout
    busybox
  ];

  virtualisation = {
    virtualbox.host.enable = true;
    #waydroid.enable = true;
  };

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

  # Enable flatpak
  # services.flatpak.enable = true;
  #systemd.services.flatpak-repo = {
  # wantedBy = ["multi-user.target"];
  #path = [pkgs.flatpak];
  #script = ''
  # flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  #'';
  # };

  system.autoUpgrade = {
    enable = true;
    dates = "daily";
  };

  nix = {
    settings = {
      substituters = ["https://drakon64-nixos-cachyos-kernel.cachix.org"];
      trusted-public-keys = ["drakon64-nixos-cachyos-kernel.cachix.org-1:J3gjZ9N6S05pyLA/P0M5y7jXpSxO/i0rshrieQJi5D0="];
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
    };
  };

  # install Ollama
  #services.ollama = {
  # enable = true;
  #acceleration = "cuda";
  #};

  # Open WebUI for Ollama
  #services.open-webui.enable = true;

  #install Solaar
  services.solaar = {
    enable = true; # Enable the service
    # package = pkgs.solaar; # The package to use
    window = "hide"; # Show the window on startup (show, *hide*, only [window only])
    batteryIcons = "regular"; # Which battery icons to use (*regular*, symbolic, solaar)
  };

  # Configure console keymap
  console = {
    useXkbConfig = true;
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable bluetooth
  hardware.bluetooth.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
