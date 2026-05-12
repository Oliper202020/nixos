{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    icoutils
    kdePackages.dolphin
    kdePackages.dolphin-plugins
    kdePackages.ffmpegthumbs
    kdePackages.kde-cli-tools
    kdePackages.kaccounts-integration
    kdePackages.kaccounts-providers
    kdePackages.kdegraphics-thumbnailers
    kdePackages.kdesdk-thumbnailers
    kdePackages.kimageformats
    kdePackages.kio
    kdePackages.kio-extras # extra protocols support (sftp, fish and more)
    kdePackages.kio-fuse # to mount remote filesystems via FUSE
    kdePackages.kio-gdrive
    kdePackages.kio-admin
    kdePackages.qtsvg
    libappimage
    kdePackages.signond
    qt6.qtimageformats
    qt6.qtbase
    resvg
    taglib
  ];
}
