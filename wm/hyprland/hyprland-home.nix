{pkgs, ...}:
{
  wayland.windowManager = {
    hyprland = {
      enable = true;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
      xwayland.enable = true;
      #plugins = [
        #inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
      #];
    };
   # uwsm.enable = true;
    #hyprlock.enable = true;
  };
  home.sessionVariables.XDG_CURRENT_DESKTOP = "Hyprland";
  xdg.portal.enable = true;
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
