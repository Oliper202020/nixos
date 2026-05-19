{
  pkgs,
  ...
}:
{
  imports = [
    ./hyprland.nix
    ./noctalia.nix
  ];
  home.packages = with pkgs; [
    wl-clip-persist
    cliphist
  ];
}
