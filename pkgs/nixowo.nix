{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "NixOwO";

  buildInputs = [ pkgs.imagemagick ];

  src = pkgs.fetchurl {
    url = "https://github.com/TilCreator/NixOwO/blob/master/NixOwO.svg";
    sha256 = "0pgjjaph4ckcggv6amj69kiya0aabijvhi73f1xcg29xlpqn96br";
  };

  phases = [ "unpackPhase" "buildPhase" "installPhase" ];

  unpackPhase = ''
    cp $src NixOwO.svg
  '';

  buildPhase = ''
    convert NixOwO.svg NixOwO.png
  '';

  installPhase = ''
    cp NixOwO.png $out
  '';
}
