{
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/cacb7546-e5ea-4708-9aeb-4383f6c7691a";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/B9BC-5CB0";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/7079cb5e-8363-449e-87c5-01141e9f76a1"; }
  ];
}
