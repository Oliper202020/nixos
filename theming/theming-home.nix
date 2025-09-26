{
  pkgs,
  lib,
  inputs,
  settings,
  ...
}: {
  imports = [
    inputs.stylix.homeModules.stylix
  ];
  config.stylix = {
    enable = true;
    #gnome.enable = false;
    autoEnable = true;
    base16Scheme = lib.mkForce "${inputs.tt-schemes}/base16/${settings.base16}.yaml";
    #image = settings.wallpaper;
    polarity = settings.polarity;
    opacity = settings.opacity;
    cursor = {
      package = pkgs.${settings.cursor.package};
      name = settings.cursor.name;
      size = settings.cursor.size;
    };
    targets = {
      zen-browser = {
        profileNames = ["oliver"];
        #colorTheme.enable = true;
      };
      floorp = {
        profileNames = ["oliver"];
        #colorTheme.enable = true;
      };
    };
  };
}
