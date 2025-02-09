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
     clear = "command clear; and pokeget random --hide-name";
     "rebuild" = "sudo nixos-rebuild switch --flake ~/.dotfiles; and home-manager switch --flake ~/.dotfiles";
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
