{
  pkgs,
  ...
}:
{
  imports = [
    # Inculde the nvidia config
    ./theming/theming.nix
    #./home.nix
    ./modules/nixos
    #./desktop/gnome.nix
    ./hosts/common
  ];

  # xdg.portal = {
  # enable = true;
  # extraPortals = with pkgs; [
  # xdg-desktop-portal-hyprland
  # xdg-desktop-portal-gtk
  # ];
  #};

  programs.virt-manager.enable = true;
  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true; # fix usb passthrough for libvirt
    # vmware.host.enable = true;
    # virtualbox = {
    #   host = {
    #     # enable = true;
    #   };
    # };
  };
  xdg = {
    icons.fallbackCursorThemes = [ "BreezeX-RoséPine" ];
  };
  environment.variables = {
    XCURSOR_THEME = "BreezeX-RoséPine";
    XCURSOR_SIZE = "24";
  };
  # nixpkgs.overlays = [
  #   (final: prev: {
  #     inherit (prev.lixPackageSets.stable)
  #       nixpkgs-review
  #       nix-eval-jobs
  #       nix-fast-build
  #       colmena
  #       ;
  #   })
  # ];
  # nix.package = pkgs.lixPackageSets.stable.lix;

  networking.wireless.userControlled = true;
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
  # system = {
  #   #rebuild.enableNg = true;
  #   autoUpgrade = {
  #     enable = true;
  #     dates = "daily";
  #   };
  # };
  documentation.enable = false;
  nix = {
    channel.enable = true;
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  # install Ollama
  services = {
    open-webui = {
      enable = true;
      openFirewall = true;
    };
    ollama = {
      enable = true;
      package = pkgs.ollama; # -rocm;
      loadModels = [
        "llama3.2:3b"
        "deepseek-r1:1.5b"
        "wmb/llamasupport"
        "demodllc/demod-nix-assistant:8b"
      ];
    };
  };

  # Open WebUI for Ollama
  #services.open-webui.enable = true;
  services = {
    tuned.enable = true;
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
      publish = {
        enable = true;
        userServices = true;
      };
    };
    ipp-usb.enable = true;
    printing.enable = true;
    # from nixos-hardware/common/pc/ssd
    fstrim.enable = true;
    upower.enable = true;
    # Enable sound with pipewire.
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
  security.rtkit.enable = true;
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    GTK_CSD = "0";
    GDK_SCALE = "1";
  };
  programs.localsend = {
    enable = true;
  };
  services.gvfs.enable = true; # Mount, trash, and other functionalities
  # use the example session manager (no others are packaged yet so this is enabled by default,
  # no need to redefine it in your config for now)
  #media-session.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  security.sudo-rs.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s peectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
