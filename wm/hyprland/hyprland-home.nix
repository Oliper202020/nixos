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
  #services.hypridle = {
  #  enable.true;
  #  settings = {
  #    general = {
  #      after_sleep_cmd = "hyprctl dispatch dpms on";
  #      ignore_dbus_inhibit = false;
  #      lock_cmd = "hyprlock";
  #    };
  #    listener = [
  #      {
  #        timeout = 900;
  #        on-timeout = "hyprlock";
  #      }
  #      {
  #        timeout = 1200;
  #        on-timeout = "hyprctl dispatch dpms off";
  #        on-resume = "hyprctl dispatch dpms on";
  #      }
  #    ];
  #  };
  #};
}
