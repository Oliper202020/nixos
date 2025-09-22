{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    android-tools
    any-nix-shell
    brightnessctl
    busybox
    dconf
    git
    jq
    playerctl
    pokeget-rs
    protonup
    rose-pine-hyprcursor
    udiskie
    uutils-coreutils-noprefix
    uutils-diffutils
    uutils-findutils
    wget
    xdg-desktop-portal-hyprland
  ];
}
