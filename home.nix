{pkgs, lib, ...}: {
  imports = [
    ./modules/home-manager
    ./theming/theming-home.nix
    ./wm/hyprland
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.

  home = {
    username = "oliver";
    homeDirectory = "/home/oliver";
  };

  #programs.kitty.enable = true;
  programs.git = {
    enable = true;
    userName = "oliver";
    userEmail = "oliversalvesen@proton.me";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoi breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    bottles
    cmatrix
    inkscape
    gimp3
    gparted
   # ghostty
    kdePackages.ark
    kdePackages.dolphin
    kdePackages.dolphin-plugins
    swww
    teams-for-linux
    tetris
    mangohud
    mpv
    makemkv
    nur.repos.nltch.ciscoPacketTracer8
    prismlauncher
    pipes-rs
    ungoogled-chromium
    ventoy
    vlc
    firefox
    libreoffice
    kicad-unstable
    ciscoPacketTracer8
    telegram-desktop
    ninvaders
  ];
  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/oliver/etc/profile.d/hm-session-vars.sh
  #
  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    package = lib.mkForce pkgs.rose-pine-cursor;
    name = "rose-pine-cursor";
  };
  gtk = {
    enable = true;
    cursorTheme.name = "rose-pine-cursor";
  };

  home.sessionVariables = {
    EDITOR = "helix";
    BROWSER = "floorp";
    TERMINAL = "kitty";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
