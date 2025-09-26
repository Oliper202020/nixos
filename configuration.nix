{pkgs, ...}: {
  imports = [
    # Inculde the nvidia config
    #./theming/theming.nix
    ./modules
    ./system
    ./desktop/gnome.nix
  ];

 # xdg.portal = {
   # enable = true;
   # extraPortals = with pkgs; [
     # xdg-desktop-portal-hyprland
     # xdg-desktop-portal-gtk
   # ];
  #};
  virtualisation = {
    virtualbox.host.enable = true;
    #waydroid.enable = true;
  };
  #services.mautrix-telegram.enable = true;
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
  #nixpkgs.config.allowUnfree = true;
  system = {
    rebuild.enableNg = true;
    autoUpgrade = {
      enable = true;
      dates = "daily";
    };
  };

  nix = {
    channel.enable = true;
    settings = {
      substituters = [""];
      trusted-public-keys = [""];
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

  services = {
    seatd.enable = true;
    greetd = {
      enable = false;
      settings = rec {
        initial_session = {
          command = "${pkgs.hyprland}/bin/hyprland";# and ${pkgs.hyprlock}/bin/hyprlock";
          user = "oliver";
        };
        default_session = initial_session;
        terminal.vt = 1;
      };
    };
  };

  # Configure console keymap
  console = {
    #useXkbConfig = true;
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable bluetooth
  hardware.bluetooth.enable = true;

  # Enable Network
  networking = {
    useNetworkd = true;
    networkmanager.enable = true;
  };
  # Enable sound with pipewire.
  security.rtkit.enable = true;
  services = {
   # pulseaudio.enable = false;
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };
  };

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  security.sudo-rs.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
