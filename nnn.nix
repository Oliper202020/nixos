{ config, pkgs, ... }:

{
  programs.nnn = {
    enable = true;
    bookmarks = {
      d = "~/Documents";
      D = "~/Downloads";
      p = "~/Pictures";
      v = "~/Videos";
      #dot = "~/.dotfiles";
    };
    extraPackages = with pkgs; [ 
      ffmpegthumbnailer
      mediainfo
      sxiv
    ];
  };
}
