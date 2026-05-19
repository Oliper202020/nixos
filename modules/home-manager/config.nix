{
  # home = {
  # username = "oliver";
  # homeDirectory = "/home/oliver";
  # };
  programs.git = {
    enable = true;
    settings.user = {
      name = "oliver";
      email = "oliversalvesen@proton.me";
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
  home.stateVersion = "26.05"; # Please read the comment before changing.
  home.sessionVariables = {
    # EDITOR = "zed";
    BROWSER = "zen-twilight";
    # TERMINAL = "kitty";
  };
  # https://github.com/rose-pine/steam-os/

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
