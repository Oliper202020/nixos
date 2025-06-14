{
  #user
  username = "oliver";
  full-name = "Oliver Salvesen";

  #theming
  base16 = "rose-pine";
  #wallpaper = ./theming/gruvbox.png;
  polarity = "dark";
  opacity = {
    applications = 0.8;
    desktop = 0.8;
    popups = 0.8;
    terminal = 0.8;
  };
  cursor = {
    package = "rose-pine-cursor";
    name = "rose-pine-cursor";
    size = 24;
  };
  fonts = {
    serif = {
      package = "dejavu_fonts";
      name = "DejaVu Serif";
    };
    sansSerif = {
      package = "dejavu_fonts";
      name = "DejaVu Sans";
    };
    monospace = {
      package = "nerd-fonts.jetbrains-mono";
      name = "JetBrainsMono Nerd Font Mono";
    };
    sizes = {
      applications = 12;
      terminal = 14;
      desktop = 10;
      popups = 10;
    };
  };
}
