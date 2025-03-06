{
  config,
  pkgs,
  lib,
  inputs,
  settings,
  ...
}: let
in {
  imports = [
    ./hardware-configuration.nix
    # Inculde the nvidia config
    # ./nvidia.nix
    ./nvidia/nvidia-selector.nix
    ./theming/theming.nix
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
  ];
  
  programs = {
    nh = {
      enable = true;
      flake = "/home/oliver/.dotfiles";
      clean = {
        enable = true;
        dates = "daily";
        extraArgs = "--keep-since 5d --keep 3";
      };
    };

    steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    };
    gamemode.enable = true;
  };

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOL_PATHS = "/home/${settings.username}/.steam/root/compatibilitytoold.d";
  };

  virtualisation = {
    virtualbox.host.enable = true;
    #waydroid.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.oliver = {
    shell = pkgs.fish;
    ignoreShellProgramCheck = true;
    isNormalUser = true;
    description = "Oliver Salvesen";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
    ];
  };

  # Bootloader.
  boot = {
    plymouth = {
      enable = true;
      logo = ./theming/boot-logo.png;
      # #theme = "rings";
      # themePackages = with pkgs; [
      #   # By default we would install all themes
      #   (adi1090x-plymouth-themes.override {
      #     selected_themes = [ "rings" ];
      #   })
      # ];
    };

    # Enable "Silent Boot"
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
    # Hide the OS choice for bootloaders.
    # It's still possible to open the bootloader list by pressing any key
    # It will just not appear on screen unless a key is pressed
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 0;
    };
  };

  networking = {
    hostName = "oliver"; # Define your hostname.
    networkmanager.enable = true;
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
  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = ["multi-user.target"];
    path = [pkgs.flatpak];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };
  
  system.autoUpgrade = {
    enable = true;
    dates = "daily";
  };
  
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
    };
  };
  
  services.xserver = {
    enable = true;
    excludePackages = [pkgs.xterm];
    # Configure keymap in X11
    xkb = {
      layout = "dk";
      variant = "nodeadkeys";
      options = "caps:escape"; # Remap Caps Lock to Escape
    };
    # Enable the GNOME Desktop Environment.
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # caps to esc
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = ["*"];
        settings = {
          main = {
            capslock = "escape";
          };
        };
      };
    };
  };

  # Debloat
  environment.gnome.excludePackages = with pkgs; [
    # baobab      # disk usage analyzer
    cheese # photo booth
    eog # image viewer
    epiphany # web browser
    # gedit       # text editor
    simple-scan # document scanner
    totem # video player
    yelp # help viewer
    evince # document viewer
    # file-roller # archive manager
    geary # email client
    seahorse # password manager
    # these should be self explanatory
    gnome-calculator
    gnome-calendar
    gnome-characters
    gnome-clocks
    gnome-contacts
    gnome-font-viewer
    gnome-logs
    gnome-maps
    gnome-music
    gnome-photos
    gnome-screenshot
    gnome-weather
    gnome-connections
    gnome-terminal
    gnome-console
    gnome-software
    gnome-tour
  ];
  # services.gnome.core-utilities.enable = false;

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

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "oliver";

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

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
