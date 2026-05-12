{
  config,
  lib,
  ...
}:
{
  config = lib.mkIf config.hardware.facter.detected.fingerprint.enable {
    # services.fprintd.enable = true;
    security = {
      pam.services = {
        sudo.fprintAuth = true;
        polkit.fprintAuth = true;
        login.fprintAuth = true;
      };
    };
  };
}
