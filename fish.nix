{
  programs = {
    fish = {
      enable = true;
      shellInit = ''pokeget random --hide-name'';
      interactiveShellInit = ''
        set -g fish_greeting ""
        any-nix-shell fish --info-right | source
      '';
      shellAliases = {
        "hy" = "hyfetch";
        "neo" = "fastfetch";
        clear = "command clear; and pokeget random --hide-name";
        "rebuild" = "nh os switch ~/.dotfiles; and nh home switch ~/.dotfiles";
      };
    };
    lsd = {
      enable = true;
      enableAliases = true;
    };
    carapace = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
