{
  imports = [
    ./waybar/waybar.nix
    ./hyprpanel.nix
    ./hyprlock.nix
    ./anyrun.nix
    ./wlogout/wlogout.nix
  ];
  home.file = {
    ".config/hypr/hyprland.conf".source = ./hyprland.conf;
    ".config/waybar/config.jsonc".source = ./waybar/waybar.conf;
    ".config/wlogout/icons".source = ./wlogout/icons;
  };
}
