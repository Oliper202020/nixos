{ pkgs, ... }: {
  home.packages = with pkgs; [
      bottles
      cmatrix
      inkscape
      gimp3
      gparted
      # ghostty
      kdePackages.ark
      kdePackages.dolphin
      kdePackages.dolphin-plugins
      swww
      teams-for-linux
      #tetris
      mangohud
      mpv
      # makemkv
      # nur.repos.nltch.ciscoPacketTracer8
      #ciscoPacketTracer8
      #libxml2
      prismlauncher
      pipes-rs
      ungoogled-chromium
      # ventoy
      vlc
      firefox
      libreoffice
      kicad
      kitty
      hyprland
      telegram-desktop
      #ninvaders
      minicom
      nur.repos.workman-nur.tetris-workman
      nur.repos.workman-nur.ninvaders-workman
    ];
}
