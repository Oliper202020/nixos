{ inputs, ... }: {
  imports = [
    inputs.hyprpanel.homeManagerModules.hyprpanel
  ];

  programs.hyprpanel = {
    enable = true;
    hyprland.enable = true;
    overwrite.enable = true;
    #theme = "rose_pine";
    settings = {
      theme = {
        bar = {
          transparent = true;
          buttons = {
            borderSize = "0.05em";
            enableBorders = true;
          };
        };
        osd = {
          duration = 2000;
        #  location = "bottom";
       #   orientation = "horizontaal";
        };
        font.size = "0.95rem";
      };
      bar = {
        launcher = {
          icon = "";
          rightClick = "sh $HOME/.dotfiles/theming/wall-switch.sh";
        };
        workspaces = {
          show_icons = true;
          #workspaceIcons = {"1" = ""};
        #  names = {
          #  "1" = "";  # Terminal
       #     "2" = "";  # Browser
         #   "3" = "";  # Code editor
        #    "4" = "";  # File manager
        #    "5" = "";  # Music
    #    };
        };
        clock.format = "%a %b %d  %I:%M";
      };
      menus = {
        dashboard = {
          directories.left.directory3.command = "bash -c \"xdg-open $HOME/.dotfiles/\"";
          directories.left.directory3.label = "󰚝 .dotfiles";
          shortcuts.enabled = true;
          directories.enabled = true;
          stats.enable_gpu = true;
        };
        clock = {
          time = {
            military = true;
            hideSeconds = true;
          };
          weather.unit = "metric";
        };
      };
    };
  };
}
