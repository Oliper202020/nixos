{ config, pkgs, ... }:

{
  programs.hyfetch = {
    enable = true;
    settings = {
      preset = "random";
      mode = "rgb";
      color_align = {
        mode = "horizontal";
      };
    };  
  };
}


