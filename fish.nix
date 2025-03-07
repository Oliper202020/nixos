{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellInit = ''pokeget random --hide-name'';
    interactiveShellInit = ''
      set -g fish_greeting ""
      any-nix-shell fish --info-right | source
    '';
#    plugins = [
  #    pkgs.fishPlugins.forgit
#    ];
    shellAliases = {
     # ... =  "cd ..";
     clear = "command clear; and pokeget random --hide-name";
     "rebuild" = "nh os switch ~/.dotfiles; and nh home switch ~/.dotfiles";
    };
  };
  programs.lsd = {
    enable = true;
    enableAliases = true;
  };
}
