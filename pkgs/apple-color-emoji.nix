{
  lib,
  stdenv,
}:
stdenv.mkDerivation rec {
  pname = "apple-color-emoji";
  version = "v18.4";

  src = builtins.fetchurl {
    name = "${pname}-${version}";
    url = "https://github.com/samuelngs/apple-emoji-linux/releases/download/v18.4/AppleColorEmoji.ttf";
    sha256 = "sha256:1ggahpw54rjpxirjbyarwd5gvvg1hi08zw4c1nab8dqls5xhgzd4";
  };

  # No build steps are needed – just copy the font into $out.
  installPhase = ''
    mkdir -p $out/share/fonts/truetype
    cp $src $out/share/fonts/truetype/AppleColorEmoji.ttf
  '';

  meta = with lib; {
    description = "Apple Color Emoji font for Linux";
    homepage = "https://github.com/samuelngs/apple-emoji-linux";
    # license = licenses.unfree; # the font’s license
    platforms = platforms.all;
  };
}
