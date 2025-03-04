{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellInit = ''pokeget random --hide-name'';
#    plugins = [
  #    pkgs.fishPlugins.forgit
#    ];
    shellAliases = {
     # ... =  "cd ..";
     nix-shell = "nix-shell --run fish";
     clear = "command clear; and pokeget random --hide-name";
     "rebuild" = "nh os switch ~/.dotfiles; and nh home switch ~/.dotfiles";
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
