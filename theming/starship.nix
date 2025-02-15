{
  config,
  pkgs,
  inputs,
  ...
}: let
  colors = config.lib.stylix.colors;
in {
  imports = [
    ./theming.nix
  ];
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      command_timeout = 1000;
      add_newline = true;
      format = builtins.concatStringsSep "" [
        "[](bg:#none fg:#${colors.base0C})"
        "[󰌽 ](bg:#${colors.base0C} fg:#${colors.base01})"
        "[](fg:#${colors.base0C} bg:#${colors.base02})$time$battery"
        "[](fg:#${colors.base02} bg:#${colors.base0E})$directory"
        "[](fg:#${colors.base0E} bg:#${colors.base09})$git_branch$git_status$git_metrics"
        "[](fg:#${colors.base09} bg:#none)$character"
      ];
      time = {
        disabled = false;
        time_format = "%R"; # Hour:Minute Format
        style = "bg:#1d2230";
        format = "[[ \$time ](bg:#${colors.base02} fg:#${colors.base0B})](\$style)";
      };
      battery = {
        disabled = false;
        full_symbol = "🔋⚡";
        charging_symbol = "⚡";
        discharging_symbol = "🔌";
        display = [
          {
            threshold = 100;
            style = "fg:#${colors.base0B} bg:#${colors.base02}";
            format = "🔋 Full: [$percentage](\$style)";
          }
          {
            threshold = 75;
            style = "fg:#${colors.base0A} bg:#${colors.base02}";
            format = "🔋 High: [$percentage](\$style)";
          }
          {
            threshold = 50;
            style = "fg:#${colors.base09} bg:#${colors.base02}";
            format = "🔋 Medium: [$percentage](\$style)";
          }
          {
            threshold = 25;
            style = "fg:#${colors.base08} bg:#${colors.base02}";
            format = "🔋 Low: [$percentage](\$style)";
          }
          {
            threshold = 10;
            style = "fg:#${colors.base08} bg:#${colors.base02}";
            format = "🪫 Critical: [$percentage](\$style)";
          }
        ];
      };
      directory = {
        format = "[ 󰝰 \$path ](\$style)";
        style = "fg:#${colors.base01} bg:#${colors.base0E}";
      };
      git_branch = {
        format = "[ \$symbol\$branch(:\$remote_branch) ](\$style)";
        symbol = "  ";
        style = "fg:#${colors.base02} bg:#${colors.base09}";
      };
      git_status = {
        format = "[$all_status](\$style)";
        style = "fg:#${colors.base02} bg:#${colors.base09}";
      };
      git_metrics = {
        format = "([+\$added](\$added_style))([-\$deleted](\$deleted_style))";
        added_style = "fg:#${colors.base02} bg:#${colors.base09}";
        deleted_style = "fg:#${colors.base02} bg:#${colors.base09}";
        disabled = false;
      };
      hg_branch = {
        format = "[ \$symbol\$branch ](\$style)";
        symbol = " ";
      };
      cmd_duration = {
        format = "[  \$duration ](\$style)";
        style = "fg:bright-white bg:18";
      };
      character = {
        success_symbol = "[ ➜](bold green) ";
        error_symbol = "[ ➜](#EA4D44) ";
      };
      directory.substitutions = {
        "Documents" = "󰈙 ";
        "Downloads" = " ";
        "Music" = " ";
        "Pictures" = " ";
      };
    };
  };
}
