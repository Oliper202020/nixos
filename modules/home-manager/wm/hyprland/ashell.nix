{ config, lib, ... }: let
  colors = config.lib.stylix.colors;
in
{
  programs.ashell = {
    enable = true;
    settings = {
      system = {
        indicators = [
          "Cpu"
          "Memory"
          "Temperature"
        ];
    };
      modules = {
        center = [
          "Window Title"
        ];
        left = [
          "Workspaces"
        ];
        right = [
          [
            "Clock"
            "Privacy"
            "Settings"
          ]
        ];
      };
      appearance = lib.mkForce {
        background_color = "${colors.base02}";
        workspace_colors = [
          "${colors.base08}"
          "${colors.base0E}"
        ];
        special_workspace_color = "${colors.base0C}";
      };
    };
    systemd = {
      enable = true;
      target = "hyprland-session.target";
    };
  };
}
