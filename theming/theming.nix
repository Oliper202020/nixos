{
  pkgs,
  config,
  inputs,
  settings,
  ...
}: let
  apple-emoji-linux = pkgs.callPackage ../myPkgs/apple-emoji-linux/default.nix {};
in {
  config.stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${inputs.tt-schemes}/base16/${settings.base16}.yaml";
    image = settings.wallpaper;
    polarity = settings.polarity;
    opacity = settings.opacity;
    
    cursor = {
      package = pkgs.${settings.cursor.package};
      name = settings.cursor.name;
      size = settings.cursor.size;
    };
    fonts = {
      serif = {
        package = pkgs.${settings.fonts.serif.package};
        name = settings.fonts.serif.name;
      };
      sansSerif = {
        package = pkgs.${settings.fonts.sansSerif.package};
        name = settings.fonts.sansSerif.name;
      };
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
      emoji = {
        package = apple-emoji-linux;
        name = "Apple Color Emoji";
      };
      sizes = settings.fonts.sizes;
    };
    targets.plymouth.logo = ./boot-logo.png;
  };
}
