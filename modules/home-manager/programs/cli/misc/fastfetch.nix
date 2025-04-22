{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "~/.dotfiles/theming/nwixowos.png";
        type = "kitty";
      };
      display = {
        separator = "  ";
      };
      modules = [
        # Title
        {
          type = "custom";
          format = "{#1}";
        }
        {
          type = "title";
          format = "{#1}╭───────────── {#}{user-name-colored}";
        }
        # System Information
        {
          type = "custom";
          format = "{#1}│ {#}System Information";
        }
        {
          type = "os";
          key = "{#separator}│  {#magenta}󰍹 OS";
        }
        {
          type = "kernel";
          key = "{#separator}│  {#red}󰒋 Kernel";
        }
        {
          type = "uptime";
          key = "{#separator}│  {#yellow} Uptime";
        }
        {
          type = "packages";
          key = "{#separator}│  {#green} Packages";
          format = "{all}";
        }
        {
          type = "command";
          key = "{#separator}│  {#blue} OS Age";
          text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
        }
        {
          type = "custom";
          format = "{#1}│";
        }
        # Desktop Environment
        {
          type = "custom";
          format = "{#1}│ {#}Desktop Environment";
        }
        {
          type = "de";
          key = "{#separator}│  {#magenta}󰧨 DE";
        }
        {
          type = "wm";
          key = "{#separator}│  {#red}󱂬 WM";
        }
        {
          type = "terminal";
          key = "{#separator}│  {#yellow} Terminal";
        }
        {
          type = "display";
          key = "{#separator}│  {#green}󰲎 Resolution";
        }
        {
          type = "shell";
          key = "{#separator}│  {#blue}󰞷 Shell";
        }
        {
          type = "custom";
          format = "{#1}│";
        }
        # Hardware Information
        {
          type = "custom";
          format = "{#1}│ {#}Hardware Information";
        }
        {
          type = "cpu";
          key = "{#separator}│  {#magenta}󰻠 CPU";
        }
        {
          type = "gpu";
          key = "{#separator}│  {#red}󰢮 GPU";
        }
        {
          type = "memory";
          key = "{#separator}│  {#yellow}󰍛 Memory";
        }
        {
          type = "disk";
          key = "{#separator}│  {#green}󰋊 Disk (/)";
          folders = "/";
        }
        {
          type = "custom";
          format = "{#1}│";
        }
        # Colors
        {
          type = "colors";
          key = "{#separator}│";
          symbol = "circle";
        }
        # Footer
        {
          type = "custom";
          format = "{#1}╰───────────────────────────────╯";
        }
      ];
    };
  };
}
