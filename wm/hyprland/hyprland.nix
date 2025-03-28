{
  programs = {
    hyprland = {
      enable = true;
     # withUWSM = true;
      #nvidiaPatches = true;
      xwayland.enable = true;
    };
   # uwsm.enable = true;
    #hyprlock.enable = true;
  };
  services.hypridle.enable = true;
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
  hardware = {
    graphics.enable = true;
    nvidia.modesetting.enable = true;
  };
}
