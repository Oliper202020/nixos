{ inputs, ... }: {
  imports = [
    inputs.hyprpanel.homeManagerModules.hyprpanel
  ];

  programs.hyprpanel = {
    enable = true;
    hyprland.enable = true;
    theme = "rose_pine";
    settings = {
      theme = {
        bar.transparent = true;
        font.size = "0.95rem";
      };
      bar = {
        workspaces.show_icons = true;
        clock.format = "%a %b %d  %I:%M";
      };
      menus = {
        dashboard = {
          directories.left.directory3.command = "bash -c \"xdg-open $HOME/.dotfiles/\"";
          directories.left.directory3.label = "󰚝 .dotfiles";
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

