{
  services = {
    xserver = {
      xkb = {
        layout = "us";
        variant = "workman";
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
