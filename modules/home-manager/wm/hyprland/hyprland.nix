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
      #uwsm.enable = true;
      #systemd.enable = false;
    };
    #hyprlock.enable = true;
  };
  home.sessionVariables.XDG_CURRENT_DESKTOP = "Hyprland";
  xdg.portal.enable = true;
}
