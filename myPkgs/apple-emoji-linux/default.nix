{
  lib,
  stdenv,
  fetchurl,
}:
stdenv.mkDerivation rec {
  pname = "apple-emoji-linux";
  version = "v17.4";

  src = fetchurl {
    url = "https://github.com/samuelngs/apple-emoji-linux/releases/download/${version}/AppleColorEmoji.ttf";
    sha256 = "sha256-SG3JQLybhY/fMX+XqmB/BKhQSBB0N1VRqa+H6laVUPE=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/fonts/
    cp $src $out/share/fonts/apple-emoji-linux-${version}.ttf
  '';

  meta = with lib; {
    description = "Apple color emoji font for Linux";
    homepage = "https://github.com/samuelngs/apple-emoji-linux";
    license = licenses.unfreeRedistributable;
    platforms = platforms.linux;
  };
}
