{
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/e433f930-5c0a-420a-9b7c-a71db3f4955c";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/7417-6628";
    fsType = "vfat";
    options = ["fmask=0077" "dmask=0077"];
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/78621bdb-dc59-43b2-949b-ddb207e0e65e";}
  ];
}
