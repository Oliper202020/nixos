{pkgs, ...}:
{
  wayland.windowManager = {
    hyprland = {
      enable = true;
      #withUWSM = true;
      plugins = [
        pkgs.hyprlandPlugins.hyprexpo
      ];
      #nvidiaPatches = true;
      xwayland.enable = true;
    };
   # uwsm.enable = true;
    #hyprlock.enable = true;
  };
}
