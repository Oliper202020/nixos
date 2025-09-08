_final: prev: {
  apple-color-emoji = prev.callPackage ./apple-color-emoji.nix { };
  tetris-workman = prev.callPackage ./tetris-workman.nix { };
  ninvaders-workman= prev.callPackage ./ninvaders-workman.nix { };
}
