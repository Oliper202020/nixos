{pkgs, config, ...}:
let
  colors = config.lib.stylix.colors;
in
{
  wayland.windowManager = {
    hyprland = {
      enable = true;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
      xwayland.enable = true;
      settings = {
        "$mainMod" = "SUPER";
        "$terminal" = "kitty";
        "$browser" = "zen-beta";
        "$fileManager" = "dolphin";

        exec-once = [
          "hyprpanel"
          "spotify"
          "$browser"
          "udiskie"
          "sh wall-switch.sh"
        ];

        env = [
          "XCURSOR_SIZE,24"
          "XCURSOR_THEME,rose-pine-cursor"
          "HYPRCURSOR_SIZE,24"
          "HYPRCURSOR_THEME,rose-pine-hyprcursor"
          "XDG_CURRENT_DESKTOP,Hyprland"
          "XDG_SESSION_TYPE,wayland"
          "XDG_SESSION_DESKTOP,Hyprland"
        ];

        monitor=",preferred,auto,auto";

        input = {
          kb_layout = "dk";
          kb_variant = "nodeadkeys";
          follow_mouse = "1";
          touchpad.natural_scroll = true;
        };

        general = {
          gaps_in = 3;
          gaps_out = 5;
          border_size = 2;
          layout = "dwindle";
          allow_tearing = false;
          resize_on_border = true;
          col.active_border = rgba(${colors.base08}) rgba(${colors.base0E}) 45deg;
          col.inactive_border = rgba(${colors.base02});
        };
        decoration = {
          rounding = 7 # 10
          rounding_power = 2
          # Change transparency of focused and unfocused windows
          active_opacity = 1.0
          inactive_opacity = 0.95
          shadow = {
            enabled = true
            range = 4
            render_power = 3
            color = rgba(1a1a1aee)
          };
          # https://wiki.hyprland.org/Configuring/Variables/#blur
          blur = {
            enabled = true
            size = 3
            passes = 1
            vibrancy = 0.1696
          };
        };

        bind = [
          "$mainMod, C, exec, $terminal"
          "$mainMod, Q, killactive,"
          "$mainMod SHIFT, M, exit,"
          "$mainMod, E, exec, $fileManager"
          "$mainMod, V, togglefloating,"
          "$mainMod, R, exec, $menu"
          "$mainMod, P, pseudo, # dwindle"
          "$mainMod SHIFT, J, togglesplit, # dwindle"
          "$mainMod SHIFT, L, exec, wlogout  --buttons-per-row 4 --margin-top=400px --margin-bottom=400px --margin-left=400px --margin-right=400px"
          "$mainMod, B, exec, $browser"
          # "$mainMod SHIFT, B, exec, waybar"
          "ALT, SPACE, exec, anyrun"
          #"$mainMod, TAB, hyprexpo:expo, toggle"

          # Move focus with mainMod + arrow keys
          "$mainMod, H, movefocus, l"
          "$mainMod, J, movefocus, d"
          "$mainMod, K, movefocus, u"
          "$mainMod, L, movefocus, r"

          # Switch workspaces with mainMod + [0-9]
          "$mainMod, 1, workspace, 1"
          "$mainMod, 2, workspace, 2"
          "$mainMod, 3, workspace, 3"
          "$mainMod, 4, workspace, 4"
          "$mainMod, 5, workspace, 5"
          "$mainMod, 6, workspace, 6"
          "$mainMod, 7, workspace, 7"
          "$mainMod, 8, workspace, 8"
          "$mainMod, 9, workspace, 9"
          "$mainMod, 0, workspace, 10"
          "$mainMod, G, workspace, Games"

          # Move active window to a workspace with mainMod + SHIFT + [0-9]
          "$mainMod SHIFT, 1, movetoworkspace, 1"
          "$mainMod SHIFT, 2, movetoworkspace, 2"
          "$mainMod SHIFT, 3, movetoworkspace, 3"
          "$mainMod SHIFT, 4, movetoworkspace, 4"
          "$mainMod SHIFT, 5, movetoworkspace, 5"
          "$mainMod SHIFT, 6, movetoworkspace, 6"
          "$mainMod SHIFT, 7, movetoworkspace, 7"
          "$mainMod SHIFT, 8, movetoworkspace, 8"
          "$mainMod SHIFT, 9, movetoworkspace, 9"
          "$mainMod SHIFT, 0, movetoworkspace, 10"
          "$mainMod SHIFT, G, movetoworkspace, Games"

          # Example special workspace (scratchpad)
          "$mainMod, S, togglespecialworkspace, spotify"
          "$mainMod SHIFT, S, movetoworkspace, special:spotify"

          # Scroll through existing workspaces with mainMod + scroll
          "$mainMod, mouse_down, workspace, e+1"
          "$mainMod, mouse_up, workspace, e-1"
        ];
        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];
        bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
          ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
          ",XF86MonBrightnessUp, exec, brightnessctl s 5%+"
          ",XF86MonBrightnessDown, exec, brightnessctl s 5%-"
        ];
        bindl = [
          # Requires playerctl
          ", XF86AudioNext, exec, playerctl next"
          ", XF86AudioPause, exec, playerctl play-pause"
          ", XF86AudioPlay, exec, playerctl play-pause"
          ", XF86AudioPrev, exec, playerctl previous"
        ];
      };
    };
  };
  home.sessionVariables.XDG_CURRENT_DESKTOP = "Hyprland";
  xdg.portal.enable = true;
  #services.hypridle = {
  #  enable.true;
  #  settings = {
  #    general = {
  #      after_sleep_cmd = "hyprctl dispatch dpms on";
  #      ignore_dbus_inhibit = false;
  #      lock_cmd = "hyprlock";
  #    };
  #    listener = [
  #      {
  #        timeout = 900;
  #        on-timeout = "hyprlock";
  #      }
  #      {
  #        timeout = 1200;
  #        on-timeout = "hyprctl dispatch dpms off";
  #        on-resume = "hyprctl dispatch dpms on";
  #      }
  #    ];
  #  };
  #};
}
