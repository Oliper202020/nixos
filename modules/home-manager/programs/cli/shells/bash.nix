{
  programs = {
    bash = {
      enable = true;
      initExtra = ''pokeget random --hide-name'';
      shellAliases = {
        clear = "command clear; and pokeget random --hide-name";
        "rebuild" = "nh os switch; and nh home switch";
      };
    };
  };
}
