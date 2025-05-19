{
  services = {
  #  xserver = {
    #  enable = true;
   #   excludePackages = [pkgs.xterm];
      # Configure keymap in X11
    #  xkb = {
      #  layout = "dk";
     #   variant = "nodeadkeys";
        #  };
    #};
    # caps to esc
    keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = ["*"];
          settings = {
            main = {
              capslock = "escape";
            };
          };
        };
      };
    };
  };
}
