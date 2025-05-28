{
  services = {
    xserver = {
      xkb = {
        layout = "dk";
        variant = "nodeadkeys";
      };
    };
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
