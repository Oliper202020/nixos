{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    android-tools
    any-nix-shell
    busybox
    brightnessctl
    dconf
    git
    uutils-coreutils-noprefix
    uutils-findutils
    uutils-diffutils
    pokeget-rs
    protonup
    playerctl
    udiskie
    rose-pine-hyprcursor
    wget
    jq
    kitty
    #hyprlandPlugins.hyprexpo
    nur.repos.xddxdd.magiskboot
    xdg-desktop-portal-hyprland
  ];
}
