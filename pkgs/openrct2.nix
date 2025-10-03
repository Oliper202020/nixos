{ pkgs, ... }:

pkgs.openrct2.overrideAttrs (prev: {
  src = prev.src;  # Retain the original source

  # Add a postInstall hook to handle downloading and unzipping assets
  installPhase = ''
    ${prev.installPhase}  # Run the original install phase
    wget -c "https://archive.org/download/OpenRCT2Assets/RCT.zip" -O RCT.zip
    unzip -u RCT.zip -d $out
    openrct2 --rct2-data-path=$out --rct1-data-path=$out

    # Update config.ini
    echo "[Paths]" >> $out/share/OpenRCT2/config.ini
    echo "rct2-data-path = $out" >> $out/share/OpenRCT2/config.ini
    echo "rct1-data-path = $out" >> $out/share/OpenRCT2/config.ini
  '';
})
