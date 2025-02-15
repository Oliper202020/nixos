{
  config,
  pkgs,
  inputs,
  ...
}: {
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
        "[](bg:#none fg:#5073bd)"
        "[󰌽 ](bg:#5073bd fg:#090c0c)"
        "[](fg:#5073bd bg:#1C3A5E)$time"
        "[](fg:#1C3A5E bg:#3B76F0)$directory"
        "[](fg:#3B76F0 bg:#FCF392)$git_branch$git_status$git_metrics"
        "[](fg:#FCF392 bg:#none)$character"
      ];
      time = {
        disabled = false;
        time_format = "%R"; # Hour:Minute Format
        style = "bg:#1d2230";
        format = "[[ \$time ](bg:#1C3A5E fg:#8DFBD2)](\$style)";
      };
      directory = {
        format = "[ 󰝰 \$path ](\$style)";
        style = "fg:#E4E4E4 bg:#3B76F0";
      };
      git_branch = {
        format = "[ \$symbol\$branch(:\$remote_branch) ](\$style)";
        symbol = "  ";
        style = "fg:#1C3A5E bg:#FCF392";
      };
      git_status = {
        format = "[$all_status](\$style)";
        style = "fg:#1C3A5E bg:#FCF392";
      };
      git_metrics = {
        format = "([+\$added](\$added_style))([-\$deleted](\$deleted_style))";
        added_style = "fg:#1C3A5E bg:#FCF392";
        deleted_style = "fg:#1C3A5E bg:#FCF392";
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
