{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellInit = ''pokeget random --hide-name'';
#    plugins = [
  #    pkgs.fishPlugins.forgit
#    ];
    shellAliases = {
      "..." = "cd ..";
    };
    interactiveShellInit = ''
      set -g fish_greeting ""
    '';
  };
  programs.lsd = {
    enable = true;
    enableAliases = true;
  };
}
