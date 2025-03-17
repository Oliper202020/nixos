{
  pkgs,
  config,
  inputs,
  settings,
  ...
}: {
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
    targets.floorp = {
      profileNames = ["oliver"];
      #colorTheme.enable = true;
    };
  };
}
