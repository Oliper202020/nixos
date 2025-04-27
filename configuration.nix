{pkgs, ...}: {
  imports = [
    # Inculde the nvidia config
    ./theming/theming.nix
    ./steam.nix
    ./system
    #./desktop/gnome.nix
    ./wm/hyprland/hyprland.nix
  ];
  environment.systemPackages = with pkgs; [
    android-tools
    any-nix-shell
    busybox
    dconf
    git
    uutils-coreutils-noprefix
    uutils-findutils
    uutils-diffutils
    pokeget-rs
    protonup
    playerctl
    udiskie
    rose-pine-hyprcursor
    wget
    jq
    hyprlandPlugins.hyprexpo
    nur.repos.xddxdd.magiskboot
  ];
  programs.gnome-disks.enable = true;
  virtualisation = {
    virtualbox.host.enable = true;
    waydroid.enable = true;
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

  system = {
    rebuild.enableNg = true;
    autoUpgrade = {
      enable = true;
      dates = "daily";
    };
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

  services = {
    greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          command = "${pkgs.hyprland}/bin/hyprland";
          user = "oliver";
        };
        default_session = initial_session;
        terminal.vt = 1;
      };
    };
  };

  # Configure console keymap
  console = {
    useXkbConfig = true;
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable bluetooth
  hardware.bluetooth.enable = true;

  # Enable Network
  networking.networkmanager.enable = true;

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

 # packageOverrides = pkgs: {
 #   nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/main.tar.gz") {
 #     inherit pkgs;
 #   };
 # };

  # Allow unfree packages
 # nixpkgs.config = {
  #  allowUnfree = true;
 # };
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
