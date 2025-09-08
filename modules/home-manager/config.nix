{
  # home = {
    # username = "oliver";
    # homeDirectory = "/home/oliver";
  # };

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
  home.stateVersion = "25.11"; # Please read the comment before changing.

  home.sessionVariables = {
    EDITOR = "zed";
    BROWSER = "zen-twilight";
    TERMINAL = "kitty";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
