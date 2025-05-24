{
  programs = {
    nushell = {
      enable = true;
      extraConfig = ''
        let carapace_completer = {|spans|
          carapace $spans.0 nushell ...$spans | from json
        }

        $env.config = {
          show_banner: false
          completions: {
            case_sensitive: false  # case-sensitive completions
            quick: false           # set to false to prevent auto-selecting completions
            partial: true          # set to false to prevent partial filling of the prompt
            algorithm: "fuzzy"    # prefix or fuzzy
            external: {
              enable: true
              max_results: 100
              completer: $carapace_completer
            }
          }
        }

        # Directly update PATH without splitting and joining manually
        $env.PATH = ($env.PATH | prepend "/home/myuser/.apps" | append "/usr/bin")
      '';
      shellAliases = {
        vi = "hx";
        vim = "hx";
        nano = "hx";
        "hy" = "hyfetch";
        "neo" = "fastfetch";
        "matrix" = "cmatrix";
        #clear = "command clear; pokeget random --hide-name";
       # "rebuild" = '''
     #     do {
   #         nh os switch ~/.dotfiles;
         #   nh home switch ~/.dotfiles;
       #   }
      #  ''';
      };
    };
  };
}
