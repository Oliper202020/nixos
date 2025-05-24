{ config, ... }:
let
  colors = config.lib.stylix.colors;
  fonts = config.stylix.fonts.serif;
in
{
  programs = {
    hyprlock = {
      enable = true;
      settings = {
        general = {
         # disable_loading_bar = true;
          grace = 0;
          hide_cursor = false;
          no_fade_in = false;
        };

        background = {
          monitor = "";
          blur_passes = 0;
          contrast = 0.8916;
          brightness = 0.7172;
          vibrancy = 0.1696;
          vibrancy_darkness = 0.0;
        };

        label = [
          {
            # Day-Month-Date
            monitor = "";
            text = ''cmd[update:1000] echo -e "$(date +"%A, %B %d")"'';
            color = "rgba(${colors.base08}aa";
            font_size = 28;
            font_family = "${fonts.package}" + " Bold";
            position = "0, 490";
            halign = "center";
            valign = "center";
          }
          # Time
          {
            monitor = "";
            text = ''cmd[update:1000] echo "<span>$(date +"%I:%M")</span>"'';
            color = "rgba(${colors.base08}aa";
            font_size = 160;
            font_family = "steelfish outline regular";
            position = "0, 370";
            halign = "center";
            valign = "center";
          }
          # USER
          {
            monitor = "";
            text = "    $USER";
            color = "rgba(${colors.base08}aa";
            outline_thickness = 2;
            dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
            dots_spacing = 0.2; # Scale of dots' absolute size, 0.0 - 1.0
            dots_center = true;
            font_size = 18;
            font_family = "${fonts.package}" + " Bold";
            position = "0, -180";
            halign = "center";
            valign = "center";
          }
        ];
      };
    };
  };
}
