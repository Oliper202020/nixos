{pkgs, ...}: {
  imports = [
    ./spicetify.nix
    ./nixcord.nix
    ./zed.nix
    ./browsers/floorp.nix
   # ./browsers/ungoogled-chromium.nix
    ./browsers/zen-browser.nix
    ./cli/btop.nix
    ./cli/kitty.nix
    ./cli/hyfetch.nix
    ./cli/helix.nix
    ./cli/files/nnn.nix
    ./cli/files/ranger.nix
    ./cli/shells/fish.nix
    ./cli/shells/nushell.nix
    ./theming/starship.nix
    ./theming/theming-home.nix
    ./wm/hyprland/waybar/waybar.nix
    ./wm/hyprland/hyprpanel.nix
    #./wm/hyprland/hyprland-home.nix
    ./wm/hyprland/anyrun.nix
    ./wm/hyprland/wlogout/wlogout.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.

  home.username = "oliver";
  home.homeDirectory = "/home/oliver";

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
    gimp
    gparted
    ghostty
    fastfetch
    kdePackages.dolphin
    swww
    teams-for-linux
    tetris
    mangohud
    mpv
    makemkv
    nur.repos.xddxdd.magiskboot
    prismlauncher
    pipes-rs
    ungoogled-chromium
    ventoy
    vlc
    firefox

  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/fastfetch/config.jsonc".source = ./cli/fastfetch.conf;
    ".config/hypr/hyprland.conf".source = ./wm/hyprland/hyprland.conf;
    #".config/hypr/hypridle.conf".source = ./wm/hyprland/hypridle.conf;
    ".config/waybar/config.jsonc".source = ./wm/hyprland/waybar/waybar.conf;
    ".config/wlogout/icons".source = ./wm/hyprland/wlogout/icons;
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Ni123x store copy.
    #".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

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
  gtk.cursorTheme = {
    package = pkgs.rose-pine-cursor;
    name = "BreezeX-RoséPine";
    size = 24;
  };


  home.sessionVariables = {
    EDITOR = "helix";
    BROWSER = "floorp";
    TERMINAL = "kitty";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
