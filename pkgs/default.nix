{
  pkgs,
  ...
}:
{
  # Define your custom packages here
  # my-package = pkgs.callPackage ./my-package { };
  apple-color-emoji = pkgs.callPackage ./apple-color-emoji.nix { };
  tetris-workman = pkgs.callPackage ./tetris-workman.nix { };
  ninvaders-workman = pkgs.callPackage ./ninvaders-workman.nix { };
  framework-plymouth-theme = pkgs.callPackage ./framework-plymouth-theme.nix { };
  #ciscoPacketTracer8-fix = pkgs.callPackage ./ciscoPacketTracer8.nix { };
  cisco-packet-tracer_9-fix = pkgs.callPackage ./cisco-packet-tracer_9.nix { };
}
