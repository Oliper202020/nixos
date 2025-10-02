{ pkgs, ... }: {
  programs = {
    bash = {
      enable = true;
      initExtra = ''${pkgs.pokeget-rs}/bin/pokeget random --hide-name'';
      shellAliases = {
        clear = "command clear && ${pkgs.pokeget-rs}/bin/pokeget random --hide-name";
        "rebuild" = "nh os switch; and nh home switch";
      };
    };
  };
}
