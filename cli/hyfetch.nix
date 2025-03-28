{
  programs.hyfetch = {
    enable = true;
    settings = {
      preset = "random";
      mode = "rgb";
      backend = "fastfetch";
      light = "0.57";
      color_align = {
        mode = "horizontal";
      };
    };
  };
}
