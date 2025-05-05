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
        "matrix" = "cmatrix";
        clear = "command clear; and pokeget random --hide-name";
        "rebuild" = "nh os switch; and nh home switch";
      };
      shellAbbrs = {
        #"$ " = "";
        #"# " = "sudo ";
        "hy" = "hyfetch";
        "neo" = "fastfetch";
      };
    };

    lsd = {
      enable = true;
      enableFishIntegration = true;
    };
    carapace = {
      enable = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
    };
  };
}
