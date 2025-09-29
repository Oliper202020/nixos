{ pkgs, ... }: {
  programs.regreet = {
    enable = true;
    font = {
      size = 16;
      name = "Cantarell";
    };
    theme = {
      package = pkgs.rose-pine-gtk-theme;
      name = "Rose-Pine";
    };
    iconTheme = {
      package = pkgs.rose-pine-icon-theme;
      name = "Rose-Pine";
    };
    cursorTheme = {
      package = pkgs.rose-pine-hyprcursor;
      name = "rose-pine-hyprcursor";
    };

  };
}
