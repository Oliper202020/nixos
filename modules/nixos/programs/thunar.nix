{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.thunar.enable = lib.mkOption {
    default = false;
  };
  config = lib.mkIf config.thunar.enable {
    programs.thunar = {
      enable = true;
      plugins = with pkgs; [
        thunar-archive-plugin
        thunar-volman
        thunar-media-tags-plugin
        thunar-vcs-plugin
        gvfs
      ];
    };
    programs.xfconf.enable = true;
    services.tumbler.enable = true; # Thumbnail support for images
  };
}
