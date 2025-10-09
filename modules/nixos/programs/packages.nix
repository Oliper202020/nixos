{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    android-tools
    any-nix-shell
    brightnessctl
    dconf
    jq
    playerctl
    protonup
    rose-pine-hyprcursor
    udiskie
    uutils-coreutils-noprefix
    uutils-diffutils
    uutils-findutils
    wget
  ];
}
