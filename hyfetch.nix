{ config, pkgs, ... }:

{
  programs.hyfetch = {
    enable = true;
    settings = {
      preset = "rainbow";
      mode = "rgb";
      color_align = {
        mode = "horizontal";
      };
    };  
  };
}


