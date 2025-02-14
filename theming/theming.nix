{pkgs, ...}: let
  apple-emoji-linux = pkgs.callPackage ../myPkgs/apple-emoji-linux/default.nix {};
in {
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
    image = ./nixos-wallpaper.png;
    polarity = "dark";
    opacity = {
      applications = 0.8;
      desktop = 0.8;
      popups = 0.8;
      terminal = 0.8;
    };
    # iconTheme = {
    #   enable = true;
    #   package = pkgs.rose-pine-icon-theme;
    #   name = "rose-pine-icon-theme";
    # };
    # cursor = {
    #   package = pkgs.rose-pine-cursor;
    #   name = "rose-pine-cursor";
    # };
    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
      emoji = {
        package = apple-emoji-linux;
        name = "Apple Color Emoji";
      };
      sizes = {
        applications = 10;
        terminal = 12;
        desktop = 10;
        popups = 10;
      };
    };
  };
}
