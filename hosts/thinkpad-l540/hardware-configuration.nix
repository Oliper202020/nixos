{
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/cc7d9c87-dc4a-47d7-8c50-2c2a5fc2dff2";
      fsType = "ext4";
    };
  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/4FEE-9BDC";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };
  swapDevices =
    [ { device = "/dev/disk/by-uuid/5f8e2dd6-0685-44dc-aabc-6f29d3ca41e9"; }
    ];
}
