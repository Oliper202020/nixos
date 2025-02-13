{ lib, stdenv, fetchzip }:

stdenv.mkDerivation rec {
  pname = "apple-emoji-linux";
  version = "ios-17.4";

  src = fetchzip {
    url = "https://github.com/samuelngs/apple-emoji-linux/archive/refs/heads/master.zip";
    sha256 = "0vld2ip96pkdj5rpnmfxv36vym0gh854w2n493izfrx3vqnb278i";
  };

  buildInputs = [];

  installPhase = ''
    mkdir -p $out/share/fonts
    cp -r $src/fonts $out/share/fonts/apple-emoji
  '';

  meta = with lib; {
    description = "Apple's vibrant emojis for Linux";
    homepage = "https://github.com/samuelngs/apple-emoji-linux";
    license = licenses.unfreeRedistributable;
    platforms = platforms.linux;
  };
}

