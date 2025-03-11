{pkgs, ...}: {
  services.xserver = {
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
    desktopManager.gnome.enable = true;
  };

  # Debloat
  environment.gnome.excludePackages = with pkgs; [
    # baobab      # disk usage analyzer
    cheese # photo booth
    eog # image viewer
    epiphany # web browser
    # gedit       # text editor
    simple-scan # document scanner
    totem # video player
    yelp # help viewer
    evince # document viewer
    # file-roller # archive manager
    geary # email client
    seahorse # password manager
    # these should be self explanatory
    gnome-calculator
    gnome-calendar
    gnome-characters
    gnome-clocks
    gnome-contacts
    gnome-font-viewer
    gnome-logs
    gnome-maps
    gnome-music
    gnome-photos
    gnome-screenshot
    gnome-weather
    gnome-connections
    gnome-terminal
    gnome-console
    gnome-software
    gnome-tour
  ];
  # services.gnome.core-utilities.enable = false;

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
}
