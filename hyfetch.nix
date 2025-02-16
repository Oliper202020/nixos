{ config, pkgs, ... }:

{
  programs.hyfetch = {
    enable = true;
    settings = {
      preset = "random";
      mode = "rgb";
      # lightness = "0.50";
      color_align = {
        mode = "horizontal";
      };
    };  
  };
}


