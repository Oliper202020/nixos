{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellInit = ''
      pokeget random --hide-name
    '';
  };
}
