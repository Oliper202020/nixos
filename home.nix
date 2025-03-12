{pkgs, ...}: {
  imports = [
    ./spicetify.nix
    ./nixcord.nix
    ./kitty.nix
    #./ungoogled-chromium.nix
    ./fish.nix
    ./hyfetch.nix
    ./nnn.nix
    ./ranger.nix
    ./theming/starship.nix
    ./theming/theming-home.nix
    ./helix.nix
    ./floorp.nix
    ./btop.nix
    ./window-manager/hyprland/eww.nix
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
    ungoogled-chromium
    vlc
    firefox
    makemkv
    prismlauncher
    bottles
    ventoy
    inkscape
    gimp
    gparted
    mangohud
    ghostty
    fastfetch
    cmatrix
    kdePackages.dolphin
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/fastfetch/config.jsonc".source = ./fastfetch.conf;
    ".config/hypr/hyprland.conf".source = ./window-manager/hyprland/hyprland.conf;
    ".config/eww/eww.yuck".source = ./window-manager/hyprland/eww.conf;
    ".config/eww/eww.scss".source = ./window-manager/hyprland/eww.scss;
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
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
  home.sessionVariables = {
    EDITOR = "helix";
    BROWSER = "floorp";
    TERMINAL = "kitty";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
