{
  programs.hyfetch = {
    enable = true;
    settings = {
      preset = "rainbow";
      mode = "rgb";
      backend = "fastfetch";
      light = "0.57";
      color_align = {
        mode = "horizontal";
      };
      pride_month_disable = false;
    };
  };
}
