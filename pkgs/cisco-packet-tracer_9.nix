{
  pkgs,
  ...
}:

pkgs.cisco-packet-tracer_9.overrideAttrs (prev: {
  src = pkgs.fetchurl {
    url = "https://archive.org/download/packettracer900/CiscoPacketTracer_900_Ubuntu_64bit.deb";
    sha256 = "086r5qbvvf8qarp554j4q4044vgswv3xfzv2iyvdqdzwqzac16nx";
  };
})
