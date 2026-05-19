{
  config,
  ...
}:
let
  colors = config.lib.stylix.colors;
in
{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    enableBashIntegration = true;
    settings = {
      command_timeout = 1000;
      add_newline = true;
      format = builtins.concatStringsSep "" [
        "[](bg:#none fg:#${colors.base0C})"
        "[$shell](fg:#${colors.base01} bg:#${colors.base0C})"
        "[](fg:#${colors.base0C} bg:#${colors.base02})$cmd_duration$battery" # "$time$battery"
        "[](fg:#${colors.base02} bg:#${colors.base0E})$directory"
        "[](fg:#${colors.base0E} bg:#${colors.base08})$git_branch$git_status$git_metrics"
        "[](fg:#${colors.base08} bg:#none)
$character"
      ];

      right_format = builtins.concatStringsSep "" [
        "[$nix_shell](fg:#${colors.base0E} bg:#${colors.base08})"
      ];

      #  custom.any_nix_shell = {
      #    command = "any-nix-shell fish --info-right | source";
      #    format = "[$output]";
      #  };
      nix_shell = {
        disabled = false;
        symbol = "*";
        pure_msg = "";
        impure_msg = "";
      };
      shell = {
        fish_indicator = "";
        bash_indicator = "";
        nu_indicator = "󰟆";
        unknown_indicator = "?";
        format = "[$indicator](fg:#${colors.base01} bg:#${colors.base0C})"; # format = "[ shell: fish ](bg:#${colors.base0C} fg:#${colors.base0B})";
        disabled = false;
      };
      time = {
        disabled = false;
        time_format = "%R"; # Hour:Minute Format
        format = "[[ \$time ](fg:#${colors.base0B} bg:#${colors.base02})](\$style)";
      };
      cmd_duration = {
        #format = "[  $duration ]($style)";
        format = "[[ 󱦟 $duration](fg:#${colors.base0B} bg:#${colors.base02})](\$style)";
        show_notifications = false;
        min_time_to_notify = 60000;
      };
      nix_shell = {
        #format = "[  $duration ]($style)";
        format = "via [$symbol$state( (($name)))]($style)";
      };
      battery = {
        disabled = false;
        format = "[[$symbol$percentage](fg:#${colors.base0B} bg:#${colors.base02})](\$style)";
        full_symbol = " 󰁹󱐋";
        display = [
          {
            threshold = 10;
            charging_symbol = " 󰁺󱐋";
            discharging_symbol = " 󰂎";
          }
          {
            threshold = 20;
            charging_symbol = " 󰁻󱐋";
            discharging_symbol = " 󰁻";
          }
          {
            threshold = 30;
            charging_symbol = " 󰁼󱐋";
            discharging_symbol = " 󰁼";
          }
          {
            threshold = 40;
            charging_symbol = " 󰁽󱐋";
            discharging_symbol = " 󰁽";
          }
          {
            threshold = 50;
            charging_symbol = " 󰁾󱐋";
            discharging_symbol = " 󰁾";
          }
          {
            threshold = 60;
            charging_symbol = " 󰁿󱐋";
            discharging_symbol = " 󰁿";
          }
          {
            threshold = 70;
            charging_symbol = " 󰂀󱐋";
            discharging_symbol = " 󰂀";
          }
          {
            threshold = 80;
            charging_symbol = " 󰂁󱐋";
            discharging_symbol = " 󰂁";
          }
          {
            threshold = 90;
            charging_symbol = " 󰂂󱐋";
            discharging_symbol = " 󰂂";
          }
          {
            threshold = 100;
            charging_symbol = " 󰁹󱐋";
            discharging_symbol = " 󰁹";
          }
        ];
      };
      directory = {
        format = "[ 󰝰 $path ]($style)";
        style = "fg:#${colors.base01} bg:#${colors.base0E}";
        #fish_style_pwd_dir_length = 1;
        truncate_to_repo = false;
        truncation_length = 3;
        home_symbol = "~";
        substitutions = {
          "Documents" = "󰈙";
          "Downloads" = "";
          "Music" = "";
          "Pictures" = "";
        };
      };
      git_branch = {
        format = "[ \$symbol\$branch(:\$remote_branch) ](\$style)";
        symbol = "  ";
        style = "fg:#${colors.base02} bg:#${colors.base08}";
      };
      git_status = {
        format = "[$all_status](\$style)";
        style = "fg:#${colors.base02} bg:#${colors.base08}";
      };
      git_metrics = {
        format = "([+\$added](\$added_style))([-\$deleted](\$deleted_style))";
        added_style = "fg:#${colors.base02} bg:#${colors.base08}";
        deleted_style = "fg:#${colors.base02} bg:#${colors.base08}";
        disabled = false;
      };
      hg_branch = {
        format = "[ \$symbol\$branch ](\$style)";
        symbol = " ";
      };
      #  cmd_duration = {
      #   format = "[  \$duration ](\$style)";
      #  style = "fg:bright-white bg:18";
      # };
      character = {
        success_symbol = "[ ➜](bold green) ";
        error_symbol = "[ ➜](#EA4D44) ";
      };
    };
  };
}
