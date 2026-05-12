{
  stdenvNoCC,
  fetchFromSourcehut,
  lib,
}:

stdenvNoCC.mkDerivation {
  pname = "framework-plymouth-theme";
  version = "b801f5bb";

  src = fetchFromSourcehut {
    owner = "~jameskupke";
    repo = "framework-plymouth-theme";
    rev = "b801f5bbf41df1cd3d1edeeda31d476ebf142f67";
    hash = "sha256-TuD+qHQ6+csK33oCYKfWRtpqH6AmYqvZkli0PtFm8+8=";
    vc = "git";
    domain = "sr.ht";
  };

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/share/plymouth/themes
    cp -r framework $out/share/plymouth/themes/framework
    find $out/share/plymouth/themes/ -name \*.plymouth -exec sed -i "s@\/usr\/@$out\/@" {} \;
  '';

  meta = {
    description = "Framework Plymouth theme";
    homepage = "https://git.sr.ht/~jameskupke/framework-plymouth-theme";
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
    maintainers = with lib.maintainers; [ Oliper202020 ];
  };
}
