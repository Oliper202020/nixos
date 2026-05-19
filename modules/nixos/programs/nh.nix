{
  #settings,
  config,
  lib,
  ...
}:
{
  options.nh.enable = lib.mkOption {
    default = true;
  };
  config = lib.mkIf config.nh.enable {
    programs.nh = {
      enable = true;
      #flake = "/home/${settings.username}/.dotfiles";
      clean = {
        enable = true;
        dates = "daily";
        extraArgs = "--keep-since 5d --keep 3";
      };
    };
  };
}
