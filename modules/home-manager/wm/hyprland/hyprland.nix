{pkgs, config, lib, ...}:
let
  colors = config.lib.stylix.colors;
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
    xwayland.enable = true;
    plugins = [

    ];
    settings = {
      "$mainMod" = "SUPER";
      "$terminal" = "kitty";
      "$browser" = "zen-twilight";
      "$fileManager" = "thunar";

      exec-once = [
        "hyprlock"
        #"ashell"
        "spotify"
        "$browser"
        "udiskie"
        "sh wall-switch.sh"
        "wl-clip-persist --clipboard both &"
        "wl-paste --watch cliphist store &"
        "[specialworkspace btop] btop"
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
        kb_layout = "us";
        kb_variant = "workman";
        #kb_variant = "nodeadkeys";
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
        "col.active_border" = lib.mkForce "rgb(${colors.base08}) rgb(${colors.base0E})";
        "col.inactive_border" = lib.mkForce "rgba(${colors.base03}aa) rgba(${colors.base04}aa)";
      };
      decoration = {
        rounding = 7; # 10
        rounding_power = 2;
        active_opacity = 1.0;
        inactive_opacity = 0.95;
        shadow = {
          enabled = true;
          range = 5;
          render_power = 3;
          color = lib.mkForce "rgba(${colors.base01}ed)";
        };
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
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
        "$mainMod, L, exec, killall wlogout 2>/dev/null; wlogout -b 4 -T 400 -B 400 -L 400 -R 400"
        "$mainMod, K, exec, $browser"
        #"$mainMod, W, exec, [workspace, special:btop] btop"
        # "$mainMod SHIFT, B, exec, waybar"
        "ALT, SPACE, exec, killall wlogout 2>/dev/null; anyrun"
        #"$mainMod, TAB, hyprexpo:expo, toggle"

        # Move focus with mainMod + arrow keys
        "$mainMod, H, movefocus, l"
        "$mainMod, J, movefocus, d"
        "$mainMod, K, movefocus, u"
        "$mainMod, L, movefocus, r"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        "$mainMod, G, workspace, Games"
        "$mainMod SHIFT, G, movetoworkspace, Games"
        "$mainMod, S, togglespecialworkspace, spotify"
        "$mainMod SHIFT, S, movetoworkspace, special:spotify"
        "$mainMod, B, togglespecialworkspace, btop"
        "$mainMod SHIFT, B, movetoworkspace, special:btop"


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
      ecosystem = {
        no_donation_nag = true;
        no_update_news = true;
      };
      misc = {
        disable_hyprland_logo = true;
        force_default_wallpaper = 0;
      };
      windowrulev2 = [
        "workspace 1, class:$terminal"
        "workspace 2, class:floorp"
        "workspace 2, class:$browser"
        "workspace 3, class:org.kde.dolphin"
        "workspace 11, class:steam"
        # Fix some dragging issues with XWayland
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
        # Ignore maximize requests from apps. You'll probably like this.
        "suppressevent maximize, class:."
      ];
      animations = {
        enabled = true;
        bezier = [
          "fluent_decel, 0, 0.2, 0.4, 1"
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];
      };
      animation = [
        # name, enable, speed, curve, style
        "global, 1, 2, default"
        # Windows
        "windowsIn, 0, 1.5, easeOutQuint, popin 20%" # window open
        "windowsOut, 0, 1.5, fluent_decel, popin 80%" # window close.
        "windowsMove, 1, 2, fluent_decel, slide" # everything in between, moving, dragging, resizing.
        "border, 1, 2.7, easeOutQuint"  # for animating the border's color switch speed
        "borderangle, 1, 120, fluent_decel, loop"#once" # for animating the border's gradient angle - styles: once (default), loop
        "workspaces, 1, 2, default, slide" # styles: slide, slidevert, fade, slidefade, slidefadevert
        "specialWorkspace, 1, 1.5, default, slidevert"
      ];
    };
  };
  home.sessionVariables.XDG_CURRENT_DESKTOP = "Hyprland";
  xdg.portal.enable = true;
  systemd.user.targets.hyprland-session.Unit.Wants = [
    "xdg-desktop-autostart.target"
  ];
}
