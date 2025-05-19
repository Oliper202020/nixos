{pkgs, ...}:
{
  programs = {
    hyprland = {
      enable = true;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
      xwayland.enable = true;
    };
  };


  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-wlr];
  };
  environment.pathsToLink = ["/libexec"];
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
  hardware = {
    graphics.enable = true;
    nvidia.modesetting.enable = true;
  };
  services.xserver = {
    enable = true;
    excludePackages = [pkgs.xterm];
  };

}
